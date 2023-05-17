import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';


class GetAllSkinDiseasesUseCase
    implements
        BaseUseCase<Either<Failure, List<Disease>>, NoParameters> {
  final BaseMedicalDetailsRepository baseMedicalRepository;

  GetAllSkinDiseasesUseCase(this.baseMedicalRepository);

  @override
  Future<Either<Failure, List<Disease>>> call(
      NoParameters parameters) async {
    return await baseMedicalRepository.getAllSkinDieases();
  }
}
