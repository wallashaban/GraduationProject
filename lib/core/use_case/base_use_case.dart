abstract class BaseUseCase<T, Parameters> {
  Future<T> call(Parameters parameters);
}

class NoParameters {
  const NoParameters();
}


class LoginUserParameters {
  String email;
  String password;
  String fcmToken;
  LoginUserParameters({
    required this.email,
    required this.password,
    required this.fcmToken,
  });
}

class RegisterUserParameters {
  String name;
  String email;
  String password;
  String passwordConfirm;
  String gender;
  String birthDate;
  String fcmToken;
  RegisterUserParameters({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.gender,
    required this.birthDate,
    required this.fcmToken,
  });
}


class UpdatePasswordParameters {
  String code;
  String password;
  String passwordConfirm;
  UpdatePasswordParameters({
    required this.code,
    required this.password,
    required this.passwordConfirm,
  });
}

class LoginWithFacebookOrGoogleParameters {
  String oauthToken;
  String provider;
  String fcmToken;
  LoginWithFacebookOrGoogleParameters({
    required this.oauthToken,
    required this.provider,
    required this.fcmToken,
  });
}

