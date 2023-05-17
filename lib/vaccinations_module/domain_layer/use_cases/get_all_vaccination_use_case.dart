import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';
import '../entities/vaccination.dart';
import '../repository/base_vaccination_repo.dart';

class GetAllVaccinationUseCase
    implements BaseUseCase<Either<Failure, List<Vaccination>>, NoParameters> {
  final BaseVaccinationRepository baseVaccinationRepository;

  GetAllVaccinationUseCase(this.baseVaccinationRepository);

  @override
  Future<Either<Failure, List<Vaccination>>> call(
      NoParameters parameters) async {
    return await baseVaccinationRepository.getAllVaccination();
  }
}
