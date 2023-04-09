import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/entities/vaccination.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/repository/base_vaccination_repo.dart';

class GetSingleVaccinationUseCase
    implements BaseUseCase<Either<Failure, Vaccination>, int> {
  final BaseVaccinationRepository baseVaccinationRepository;

  GetSingleVaccinationUseCase(this.baseVaccinationRepository);

  @override
  Future<Either<Failure, Vaccination>> call(
      int id) async {
    return await baseVaccinationRepository.getSingleVaccination(id);
  }
}
