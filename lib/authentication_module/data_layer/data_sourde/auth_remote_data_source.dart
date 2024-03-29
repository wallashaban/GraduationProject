import '../../../core/utils/dio_helper.dart';
import '../../../core/utils/exports.dart';
import '../../../settings_notifications_module/data_layer/models/user_update_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<AuthenticationModel> registerUser(RegisterUserParameters parameters);
  Future<AuthenticationModel> loginUser(LoginUserParameters parameters);
  Future<Authentication> loginWithGoogle(
      LoginWithFacebookOrGoogleParameters parameters);
  Future<Authentication> loginWithFacebook(
      LoginWithFacebookOrGoogleParameters parameters);
  Future<void> forgetPassword(String email);
  Future<void> checkCode(String code);
  Future<void> updatePassword(UpdatePasswordParameters parameters);
   Future<UserUpdateModel> updateUserInfo(RegisterUserParameters parameters);

}

class AuthenticationRemoteDataSource
    implements BaseAuthenticationRemoteDataSource {
  Dio? dio;

  AuthenticationRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
        });
    dio = Dio(options);
  }

  @override
  Future<AuthenticationModel> loginUser(LoginUserParameters parameters) async {
    final Response response =
        await dio!.post(AppConstants.login, queryParameters: {
      'email_or_phone': parameters.email,
      'password': parameters.password,
      'fcm_token': parameters.fcmToken,
    });
    if (response.data['status'] == true) {
      debugPrint('login remote data ${response.data}');
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<AuthenticationModel> registerUser(
      RegisterUserParameters parameters) async {
    FormData data = FormData.fromMap({
      'name': parameters.name,
      'email': parameters.email,
      'password': parameters.password,
      'password confirmation': parameters.passwordConfirm,
      'gender': parameters.gender,
      'birth_date': parameters.birthDate,
      'fcm_token': parameters.fcmToken,
      'phone_number': parameters.phone,
      'photo': parameters.photo == null
          ? null
          : await MultipartFile.fromFile(
              parameters.photo!,
            ),
    });
    final Response response = await dio!.post(
      AppConstants.register,
      data: data,
    );
    if (response.data['status'] == true) {
      debugPrint('register remote data ${response.data}');
      return AuthenticationModel.fromJson(response.data);
    } else {
      debugPrint('error${response.data}');
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<void> checkCode(String code) async {
    final Response response =
        await dio!.post(AppConstants.checkCode, queryParameters: {
      'code': code,
    });
    if (response.data['status'] == true) {
      debugPrint('check code remote data ${response.data}');
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<void> forgetPassword(String email) async {
    final Response response =
        await dio!.post(AppConstants.forgetPassword, queryParameters: {
      'email_or_phone': email,
    });
    if (response.data['status'] == true) {
      debugPrint('forgetPassword remote data ${response.data}');
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Authentication> loginWithFacebook(
      LoginWithFacebookOrGoogleParameters parameters) async {
    final Response response =
        await dio!.post(AppConstants.loginWithFacebook, queryParameters: {
      'oauth_token': parameters.oauthToken,
      'provider': parameters.provider,
      'fcm_token': parameters.fcmToken,
    });
    if (response.data['status'] == true) {
      debugPrint('Login with facebook remote data ${response.data}');
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Authentication> loginWithGoogle(
      LoginWithFacebookOrGoogleParameters parameters) async {
    GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final Response response =
        await dio!.post(AppConstants.loginWithGoogle, queryParameters: {
      'oauth_token': gAuth.accessToken,
      'provider': 'google',
      'fcm_token': parameters.fcmToken,
    });
    if (response.data['status'] == true) {
      debugPrint('Login with facebook remote data ${response.data}');
      return AuthenticationModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<void> updatePassword(UpdatePasswordParameters parameters) async {
    final Response response =
        await dio!.post(AppConstants.updatePassword, queryParameters: {
      'code': parameters.code,
      'password': parameters.password,
      'password confirmation': parameters.passwordConfirm,
    });
    if (response.data['status'] == true) {
      debugPrint('update password remote data ${response.data}');
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<UserUpdateModel> updateUserInfo(RegisterUserParameters parameters)async {
        FormData data = FormData.fromMap({
                 'name': parameters.name,
      'email': parameters.email,
      'password': parameters.password,
      'password confirmation': parameters.passwordConfirm,
      'gender': parameters.gender,
      'birth_date': parameters.birthDate,
      'photo':parameters.photo==null?null:   await MultipartFile.fromFile(parameters.photo!, ),
      'phone_number':parameters.phone,
    });
    final Response response =
        await DioHelper.postData(url: AppConstants.updateProfile,
        data: data ,
        token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('update info  remote data ${response.data}');
      return UserUpdateModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  
}
