import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

class UpdatePasswordUseCase implements BaseUseCase<Either, UpdatePasswordParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  UpdatePasswordUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure,void>> call(UpdatePasswordParameters parameters) async {
   return await baseAuthenticationRepository.updatePassword(
      parameters,
    );
  }
}
