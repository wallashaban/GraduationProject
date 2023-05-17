import 'package:dartz/dartz.dart';

import '../../../core/utils/exports.dart';

class GetAllAllMedicalTestUseCase
    implements
        BaseUseCase<Either<Failure, List<MediaclTest>>, NoParameters> {
  final BaseMedicalTestsRepository baseMedicalTestsRepository;

  GetAllAllMedicalTestUseCase(this.baseMedicalTestsRepository);

  @override
  Future<Either<Failure, List<MediaclTest>>> call(
      NoParameters parameters) async {
    return await baseMedicalTestsRepository.getAllMedicalTest();
  }
}
