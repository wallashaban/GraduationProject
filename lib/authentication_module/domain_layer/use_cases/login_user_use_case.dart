import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';


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
