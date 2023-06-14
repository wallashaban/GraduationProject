import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';
import '../repository/base_vaccination_repo.dart';

class AttachVaccinationUseCase
    implements BaseUseCase<Either<Failure, General>, int> {
  final BaseVaccinationRepository baseVaccinationRepository;

  AttachVaccinationUseCase(this.baseVaccinationRepository);

  @override
  Future<Either<Failure, General>> call(
      int ids) async {
    return await baseVaccinationRepository.attatchVaccination(ids);
  }
}
