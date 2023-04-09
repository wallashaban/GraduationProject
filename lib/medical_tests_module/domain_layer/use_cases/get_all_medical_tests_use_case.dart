import 'package:dartz/dartz.dart';

import 'package:graduation_project/core/utils/exports.dart';

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
