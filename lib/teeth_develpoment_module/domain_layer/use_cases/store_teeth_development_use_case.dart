import 'package:dartz/dartz.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/teeth.dart';
import '../repository/base_teeth_repository.dart';

class StoreTeethDevelopmentUseCase
    implements
        BaseUseCase<Either<Failure, Teeth>, TeethParameters> {
  final BaseTeetDevelopmentRepository baseTeetDevelopmentRepository;

  StoreTeethDevelopmentUseCase(this.baseTeetDevelopmentRepository);

  @override
  Future<Either<Failure, Teeth>> call(
      TeethParameters parameters) async {
    return await baseTeetDevelopmentRepository.storeTeethDevelopment(parameters);
  }
}
