import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

class UpdateMedicalTestUseCase
    implements
        BaseUseCase<Either<Failure, General>, MediaclTestParameters> {
  final BaseMedicalTestsRepository baseMedicalTestsRepository;

  UpdateMedicalTestUseCase(this.baseMedicalTestsRepository);

  @override
  Future<Either<Failure, General>> call(
      MediaclTestParameters parameters) async {
    return await baseMedicalTestsRepository.updateMedicalTest(parameters);
  }
}
