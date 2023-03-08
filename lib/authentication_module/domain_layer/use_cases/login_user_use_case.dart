import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../../../core/error/failure.dart';

class LoginUserUseCase
    implements BaseUseCase<Either, LoginUserParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  LoginUserUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure,Authentication>> call(LoginUserParameters parameters) async {
    return await baseAuthenticationRepository.loginUser(
      parameters,
    );
  }
}
