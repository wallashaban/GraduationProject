import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';
import '../entities/vaccination.dart';
import '../repository/base_vaccination_repo.dart';

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
