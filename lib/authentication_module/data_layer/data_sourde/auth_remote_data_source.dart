
import 'package:graduation_project/core/utils/exports.dart';

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
      'email': parameters.email,
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
    final Response response =
        await dio!.post(AppConstants.register, queryParameters: {
      'name': parameters.name,
      'email': parameters.email,
      'password': parameters.password,
      'password confirmation': parameters.passwordConfirm,
      'gender': parameters.gender,
      'birth_date': parameters.birthDate,
      'fcm_token': parameters.fcmToken,
    });
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
      'email': email,
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
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }
}
