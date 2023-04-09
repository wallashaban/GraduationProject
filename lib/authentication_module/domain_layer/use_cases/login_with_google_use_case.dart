import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';



class LoginWithGoogleUseCase
    implements BaseUseCase<Either, LoginWithFacebookOrGoogleParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  LoginWithGoogleUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure,Authentication>> call(LoginWithFacebookOrGoogleParameters parameters) async {
    return await baseAuthenticationRepository.loginWithGoogle(parameters);
  }
}
