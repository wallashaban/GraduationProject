import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';


class ForgetPasswordUseCase implements BaseUseCase<Either, String> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  ForgetPasswordUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure,void>> call(String email) async {
   return await baseAuthenticationRepository.forgetPassword(
      email,
    );
  }
}
