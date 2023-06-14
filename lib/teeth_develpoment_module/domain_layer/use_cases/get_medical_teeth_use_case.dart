import 'package:dartz/dartz.dart';
import 'package:graduation_project/teeth_develpoment_module/domain_layer/entities/medical_teeth.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../repository/base_teeth_repository.dart';

class GetMedicalTeethUseCase
    implements
        BaseUseCase<Either<Failure, List<MedicalTeeth>>, NoParameters> {
  final BaseTeetDevelopmentRepository baseTeetDevelopmentRepository;

  GetMedicalTeethUseCase(this.baseTeetDevelopmentRepository);

  @override
  Future<Either<Failure, List<MedicalTeeth>>> call(
      NoParameters parameters) async {
    return await baseTeetDevelopmentRepository.getMedicalTeeth();
  }
}
