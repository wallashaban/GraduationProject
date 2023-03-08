part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

// login states
class AuthenticationInitial extends AuthenticationState {}

class LoginUserLoadingState extends AuthenticationState {}

class LoginUserSuccessState extends AuthenticationState {}

class LoginUserErrorState extends AuthenticationState {
 final String error;
 const LoginUserErrorState({
    required this.error,
  });
}


//register states

class RegisterUserLoadingState extends AuthenticationState {}

class RegisterUserSuccessState extends AuthenticationState {}

class RegisterUserErrorState extends AuthenticationState {
 final String error;
 const RegisterUserErrorState({
    required this.error,
  });
}

// login with google states

class LoginWithGoogleLoadingState extends AuthenticationState {}

class LoginWithGoogleSuccessState extends AuthenticationState {}

class LoginWithGoogleErrorState extends AuthenticationState {
 final String error;
 const LoginWithGoogleErrorState({
    required this.error,
  });
}

// login with Facebook states

class LoginWithFacebookLoadingState extends AuthenticationState {}

class LoginWithFacebookSuccessState extends AuthenticationState {}

class LoginWithFacebookErrorState extends AuthenticationState {
 final String error;
 const LoginWithFacebookErrorState({
    required this.error,
  });
}

// forgget password states

class ForgetPasswordLoadingState extends AuthenticationState {}

class ForgetPasswordSuccessState extends AuthenticationState {}

class ForgetPasswordErrorState extends AuthenticationState {
 final String error;
 const ForgetPasswordErrorState({
    required this.error,
  });
}

// update password states

class UpdatePasswordLoadingState extends AuthenticationState {}

class UpdatePasswordSuccessState extends AuthenticationState {}

class UpdatePasswordErrorState extends AuthenticationState {
 final String error;
 const UpdatePasswordErrorState({
    required this.error,
  });
}
