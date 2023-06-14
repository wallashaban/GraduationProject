import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';

class StoreMedicalTestsUseCase
    implements
        BaseUseCase<Either<Failure, MediaclTest>, MediaclTestParameters> {
  final BaseMedicalTestsRepository baseMedicalTestsRepository;

  StoreMedicalTestsUseCase(this.baseMedicalTestsRepository);

  @override
  Future<Either<Failure, MediaclTest>> call(
      MediaclTestParameters parameters) async {
    return await baseMedicalTestsRepository.storeMedicalTest(parameters);
  }
}
