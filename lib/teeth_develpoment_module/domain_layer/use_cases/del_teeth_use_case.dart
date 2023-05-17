import 'package:dartz/dartz.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../repository/base_teeth_repository.dart';

class DeleteTeethUseCase
    implements
        BaseUseCase<Either<Failure, General>, int> {
  final BaseTeetDevelopmentRepository baseTeetDevelopmentRepository;

  DeleteTeethUseCase(this.baseTeetDevelopmentRepository);

  @override
  Future<Either<Failure, General>> call(
      int id) async {
    return await baseTeetDevelopmentRepository.deleteTeethDevelpoment(id);
  }
}
