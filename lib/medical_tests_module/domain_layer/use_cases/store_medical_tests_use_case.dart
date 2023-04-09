import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

class StoreMedicalTestsUseCase
    implements
        BaseUseCase<Either<Failure, General>, MediaclTestParameters> {
  final BaseMedicalTestsRepository baseMedicalTestsRepository;

  StoreMedicalTestsUseCase(this.baseMedicalTestsRepository);

  @override
  Future<Either<Failure, General>> call(
      MediaclTestParameters parameters) async {
    return await baseMedicalTestsRepository.storeMedicalTest(parameters);
  }
}
