import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';


class UpdateUserInfoUseCase
    implements BaseUseCase<Either, RegisterUserParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  UpdateUserInfoUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, Authentication>> call(
      RegisterUserParameters parameters) async {
    return await baseAuthenticationRepository.updateUserInfo(parameters);
  }
}
