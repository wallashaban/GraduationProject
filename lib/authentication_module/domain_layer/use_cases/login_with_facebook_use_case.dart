import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../../../core/error/failure.dart';


class LoginWithFacebookUseCase
    implements BaseUseCase<Either, LoginWithFacebookOrGoogleParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  LoginWithFacebookUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure,Authentication>> call(LoginWithFacebookOrGoogleParameters parameters) async {
    return await baseAuthenticationRepository.loginWithFacebook(parameters);
  }
}
