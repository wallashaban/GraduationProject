import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';


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
