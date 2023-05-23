import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';
import '../entites/medical_details.dart';


class StoreMedicalDetailsUseCase
    implements
        BaseUseCase<Either<Failure, MedicalDetails>, StoreMedicalDetailsParameters> {
  final BaseMedicalDetailsRepository baseMedicalRepository;

  StoreMedicalDetailsUseCase(this.baseMedicalRepository);

  @override
  Future<Either<Failure, MedicalDetails>> call(
      StoreMedicalDetailsParameters parameters) async {
    return await baseMedicalRepository.storeMedicalDetails(parameters);
  }
}
