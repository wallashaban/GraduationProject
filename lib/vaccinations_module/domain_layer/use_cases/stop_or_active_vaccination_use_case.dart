import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/repository/base_vaccination_repo.dart';

class StopOrActiveVaccinationUseCase
    implements BaseUseCase<Either<Failure, General>, int> {
  final BaseVaccinationRepository baseVaccinationRepository;

  StopOrActiveVaccinationUseCase(this.baseVaccinationRepository);

  @override
  Future<Either<Failure, General>> call(
      int status) async {
    return await baseVaccinationRepository.stopOrActiveVaccination(status);
  }
}
