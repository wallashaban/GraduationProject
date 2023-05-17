import 'package:dartz/dartz.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../repository/base_teeth_repository.dart';

class StoreTeethDevelopmentUseCase
    implements
        BaseUseCase<Either<Failure, General>, TeethParameters> {
  final BaseTeetDevelopmentRepository baseTeetDevelopmentRepository;

  StoreTeethDevelopmentUseCase(this.baseTeetDevelopmentRepository);

  @override
  Future<Either<Failure, General>> call(
      TeethParameters parameters) async {
    return await baseTeetDevelopmentRepository.storeTeethDevelopment(parameters);
  }
}
