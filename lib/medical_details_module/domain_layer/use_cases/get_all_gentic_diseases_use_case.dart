import 'package:dartz/dartz.dart';

import 'package:graduation_project/core/utils/exports.dart';


class GetAllGeneticUseCase
    implements
        BaseUseCase<Either<Failure, List<Disease>>, NoParameters> {
  final BaseMedicalDetailsRepository baseMedicalRepository;

  GetAllGeneticUseCase(this.baseMedicalRepository);

  @override
  Future<Either<Failure, List<Disease>>> call(
      NoParameters parameters) async {
    return await baseMedicalRepository.getAllGenticDiease();
  }
}
