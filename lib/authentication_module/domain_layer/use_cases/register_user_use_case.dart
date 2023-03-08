import 'package:dartz/dartz.dart';
import 'package:graduation_project/authentication_module/domain_layer/repository/base_auth_reposutory.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../../../core/error/failure.dart';

class RegisterUserUseCase
    implements BaseUseCase<Either, RegisterUserParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  RegisterUserUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure,Authentication>> call(RegisterUserParameters parameters) async {
    return await baseAuthenticationRepository.registerUser(
      parameters,
    );
  }
}
