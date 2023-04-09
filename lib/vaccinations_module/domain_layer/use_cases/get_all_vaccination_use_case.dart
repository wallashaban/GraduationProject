import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/entities/vaccination.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/repository/base_vaccination_repo.dart';

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
