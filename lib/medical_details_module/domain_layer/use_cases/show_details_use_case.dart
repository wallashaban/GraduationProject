import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';
import '../entites/medical_details.dart';


class ShowMedicalDetailsUseCase
    implements
        BaseUseCase<Either<Failure, MedicalDetails>, NoParameters> {
  final BaseMedicalDetailsRepository baseMedicalRepository;

  ShowMedicalDetailsUseCase(this.baseMedicalRepository);

  @override
  Future<Either<Failure, MedicalDetails>> call(
      NoParameters parameters) async {
    return await baseMedicalRepository.showMedicalDetails();
  }
}
