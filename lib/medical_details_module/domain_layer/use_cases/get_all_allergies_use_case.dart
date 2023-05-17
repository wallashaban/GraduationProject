import 'package:dartz/dartz.dart';

import '../../../core/utils/exports.dart';


class GetAllAllergiesUseCase
    implements
        BaseUseCase<Either<Failure, List<Allergy>>, NoParameters> {
  final BaseMedicalDetailsRepository baseMedicalRepository;

  GetAllAllergiesUseCase(this.baseMedicalRepository);

  @override
  Future<Either<Failure, List<Allergy>>> call(
      NoParameters parameters) async {
    return await baseMedicalRepository.getAllAllergies();
  }
}
