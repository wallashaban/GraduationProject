import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';

abstract class BaseAuthenticationRepository {
  Future<Either<Failure,Authentication>> registerUser(RegisterUserParameters parameters);
  Future<Either<Failure,Authentication>> loginUser(LoginUserParameters parameters);
  Future<Either<Failure,Authentication>> loginWithGoogle(LoginWithFacebookOrGoogleParameters parameters);
  Future<Either<Failure,Authentication>> loginWithFacebook(LoginWithFacebookOrGoogleParameters parameters);
  Future<Either<Failure,void>> forgetPassword(String email);
  Future<Either<Failure,void>> checkCode(String code);
  Future<Either<Failure,void>> updatePassword(UpdatePasswordParameters parameters);
}

