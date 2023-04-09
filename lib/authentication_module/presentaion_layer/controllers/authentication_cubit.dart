

import 'package:graduation_project/core/utils/exports.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUserUseCase loginUserUseCase;
  final RegisterUserUseCase registerUserUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithFacebookUseCase loginWithFacebookUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final CheckCodeUseCase checkCodeUseCase;
  AuthenticationCubit(
    this.loginUserUseCase,
    this.registerUserUseCase,
    this.loginWithGoogleUseCase,
    this.loginWithFacebookUseCase,
    this.forgetPasswordUseCase,
    this.updatePasswordUseCase,
    this.checkCodeUseCase,
  ) : super(AuthenticationInitial());

  Authentication user = const AuthenticationModel(
    id: 1,
    name: 'name',
    email: 'email',
    gender: 'gender',
    birthDate: 'birthDate',
    accessToken: 'accessToken',
  );
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );

  String gender = AppStrings.male;
  chooseGender(String gender) {
    this.gender = gender;
    emit(GenderState());
    emit(AuthDone());
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((tok) {
      AppStrings.token = tok.toString();
      debugPrint('token ${AppStrings.token}');
    });
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
      (r) {
        user = r;
        emit(RegisterUserSuccessState());
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
        // await Future.delayed(Duration(seconds: 2)).then((value) =>         emit(AuthDone()));
      },
      (r) {
        user = r;
        debugPrint('token func ${r.accessToken}');
        emit(LoginUserSuccessState());
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
