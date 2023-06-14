import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';

class UpdateMedicalTestUseCase
    implements
        BaseUseCase<Either<Failure, MediaclTest>, MediaclTestParameters> {
  final BaseMedicalTestsRepository baseMedicalTestsRepository;

  UpdateMedicalTestUseCase(this.baseMedicalTestsRepository);

  @override
  Future<Either<Failure, MediaclTest>> call(
      MediaclTestParameters parameters) async {
    return await baseMedicalTestsRepository.updateMedicalTest(parameters);
  }
}
