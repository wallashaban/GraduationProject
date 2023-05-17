import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';
import '../repository/base_vaccination_repo.dart';

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
