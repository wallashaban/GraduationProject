import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/error/failure.dart';

import 'package:graduation_project/core/utils/exports.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUserUseCase loginUserUseCase;
  final RegisterUserUseCase registerUserUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithFacebookUseCase loginWithFacebookUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  AuthenticationCubit(
    this.loginUserUseCase,
    this.registerUserUseCase,
    this.loginWithGoogleUseCase,
    this.loginWithFacebookUseCase,
    this.forgetPasswordUseCase,
    this.updatePasswordUseCase,
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
      },
    );
  }

  Future loginUser(LoginUserParameters parameters) async {
    emit(
      LoginUserLoadingState(),
    );
    final result = await loginUserUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          LoginUserErrorState(
            error: l.message,
          ),
        );
      },
      (r) {
        user = r;
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
   final result= await loginWithFacebookUseCase(parameters);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          LoginWithFacebookErrorState(
            error: l.message,
          ),
        );
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
   final result= await forgetPasswordUseCase(email);
    result.fold(
      (l) {
        serverFailure = l;
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
   final result= await updatePasswordUseCase(parameters);
    result.fold(
      (l) {
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
}
