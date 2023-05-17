import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';

class CheckCodeUseCase implements BaseUseCase<Either, String> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

 CheckCodeUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure,void>> call(String code) async {
   return await baseAuthenticationRepository.checkCode(
      code,
    );
  }
}
