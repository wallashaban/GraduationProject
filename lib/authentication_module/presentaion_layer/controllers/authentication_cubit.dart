// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/exports.dart';

import '../../../settings_notifications_module/data_layer/models/user_update_model.dart';
import '../../domain_layer/use_cases/update_user_info_use_case.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUserUseCase loginUserUseCase;
  final RegisterUserUseCase registerUserUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithFacebookUseCase loginWithFacebookUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final CheckCodeUseCase checkCodeUseCase;
  final UpdateUserInfoUseCase updateUserInfoUseCase;

  AuthenticationCubit(
    this.loginUserUseCase,
    this.registerUserUseCase,
    this.loginWithGoogleUseCase,
    this.loginWithFacebookUseCase,
    this.forgetPasswordUseCase,
    this.updatePasswordUseCase,
    this.checkCodeUseCase,
    this.updateUserInfoUseCase,
  ) : super(AuthenticationInitial());
  Authentication profileUpdate = const UserUpdateModel(
    email: '',
    id: 1,
    name: '',
    isReminderVaccine: 0,
  );
  UserDataCach? userData = Hive.box('userDataCach').get('user');

  Authentication user = const AuthenticationModel(
      id: 1,
      name: 'name',
      email: 'email',
      gender: 'gender',
      birthDate: 'birthDate',
      accessToken: 'accessToken',
      isReminderVaccine: 0);
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );

  String? gender;
  chooseGender(String gender) {
    this.gender = gender;
    emit(GenderState());
    emit(AuthDone());
  }

  FilePickerResult? result;
  File? file;
  String? filePath;
  var pickedFile;
  final picker = ImagePicker();
  Future pickImage() async {
    debugPrint('befor');
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      filePath = file!.path;
      debugPrint('picked file ${filePath!}');
    }
    emit(PickImageAuthState());
    emit(AuthDone());
  }

  deleteImage() {
    pickedFile = file = filePath = null;
    emit(DeleteImageState());
  }

  void getFcmToken() async {
    if (CashHelper.getData(key: 'fcmToken') == null) {
      await FirebaseMessaging.instance.getToken().then((tok) {
        CashHelper.saveData(key: 'fcmToken', value: tok.toString());
        /* AppStrings.token = tok.toString();
        debugPrint('token ${AppStrings.token}'); */
      });
    }
  }

  Future registerUser(RegisterUserParameters parameters) async {
    emit(
      RegisterUserLoadingState(),
    );
    final result = await registerUserUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          RegisterUserErrorState(
            error: l.message,
          ),
        );
      },
      (r) async {
        user = r;
        CashHelper.saveData(
          key: 'token',
          value: r.accessToken,
        );
        token = CashHelper.getData(key: 'token');
        emit(RegisterUserSuccessState());
        Hive.box('userDataCach').put(
            'user',
            UserDataCach(
              id: r.id,
              name: r.name,
              email: r.email,
              accessToken: r.accessToken!,
              birthDate: r.birthDate,
              gender: r.gender,
              photo: r.photo,
              phone: r.phone, //todo refactor the photo
            ));
        userData = Hive.box('userDataCach').get('user');
        userDataCach = Hive.box('userDataCach').get('user');
        CashHelper.saveData(key: 'id', value: userData!.id);

        emit(AuthDone());
      },
    );
  }

  Future updateUserInfo(RegisterUserParameters parameters) async {
    emit(
      UpdateUserInfoLoadingState(),
    );
    final result = await updateUserInfoUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          UpdateUserInfoErrorState(
            error: l.message,
          ),
        );
      },
      (r) async {
        profileUpdate = r;

        emit(UpdateUserInfoSuccessState());
        Hive.box('userDataCach').put(
            'user',
            UserDataCach(
              id: r.id,
              name: r.name,
              email: r.email,
              accessToken: '',
              birthDate: r.birthDate,
              gender: r.gender,
              photo: r.photo, //todo refactor the photo
              phone: r.phone,
            ));
        userData = Hive.box('userDataCach').get('user');
        userDataCach = Hive.box('userDataCach').get('user');

        CashHelper.saveData(key: 'id', value: userData!.id);
        // debugPrint('id update ${CashHelper.getData(key: 'id')}');
        emit(AuthDone());
      },
    );
  }

  Future loginUser(LoginUserParameters parameters) async {
    emit(
      LoginUserLoadingState(),
    );
    final result = await loginUserUseCase(parameters);
    result.fold(
      (l) async {
        serverFailure = l;
        emit(
          LoginUserErrorState(
            error: l.message,
          ),
        );
      },
      (r) async {
        user = r;

        CashHelper.saveData(
          key: 'token',
          value: r.accessToken,
        );
        token = r.accessToken!;
        emit(LoginUserSuccessState());
        Hive.box('userDataCach').put(
            'user',
            UserDataCach(
              id: r.id,
              name: r.name,
              email: r.email,
              accessToken: r.accessToken!,
              birthDate: r.birthDate,
              gender: r.gender,
              photo: r.photo,
              phone: r.phone, //todo refactor the photo
            ));
        userData = Hive.box('userDataCach').get('user');
        userDataCach = Hive.box('userDataCach').get('user');
        CashHelper.saveData(key: 'id', value: userData!.id);
        emit(AuthDone());
      },
    );
  }

  Future loginWithGoogle(LoginWithFacebookOrGoogleParameters parameters) async {
    emit(
      LoginWithGoogleLoadingState(),
    );
    final result = await loginWithGoogleUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          LoginWithGoogleErrorState(
            error: l.message,
          ),
        );
        emit(AuthDone());
      },
      (r) {
        user = r;
        emit(LoginWithFacebookSuccessState());
      },
    );
  }

  Future loginWithFacebook(
      LoginWithFacebookOrGoogleParameters parameters) async {
    emit(
      LoginWithFacebookLoadingState(),
    );
    final result = await loginWithFacebookUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          LoginWithFacebookErrorState(
            error: l.message,
          ),
        );
        emit(AuthDone());
      },
      (r) {
        user = r;
        emit(LoginWithFacebookSuccessState());
      },
    );
  }

  String? messageCode;
  Future forgetPassword(String email) async {
    emit(
      ForgetPasswordLoadingState(),
    );
    final result = await forgetPasswordUseCase(email);
    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('erroor email ${l.message}');
        emit(
          ForgetPasswordErrorState(
            error: l.message,
          ),
        );
      },
      (r) {
        emit(ForgetPasswordSuccessState());
      },
    );
  }

  Future updatePassword(UpdatePasswordParameters parameters) async {
    emit(
      UpdatePasswordLoadingState(),
    );
    final result = await updatePasswordUseCase(parameters);
    result.fold(
      (l) async {
        serverFailure = l;
        emit(
          UpdatePasswordErrorState(
            error: l.message,
          ),
        );
      },
      (r) {
        emit(UpdatePasswordSuccessState());
      },
    );
  }

  Future checkCode(String code) async {
    emit(CheckCodeLoadingState());
    final result = await checkCodeUseCase(code);
    result.fold(
      (l) async {
        serverFailure = l;
        emit(
          CheckCodeErrorState(
            error: l.message,
          ),
        );
      },
      (r) {
        emit(CheckCodeSuccessState());
      },
    );
  }

  bool isPassword = true;
  obscurePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
    emit(AuthDone());
  }
}
