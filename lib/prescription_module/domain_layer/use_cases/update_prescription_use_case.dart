import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/prescribtion.dart';
import '../repository/base_prescription_repository.dart';

class UpdatePrescriptionUseCase
    implements
        BaseUseCase<Either<Failure, Presccription>, PresccriptionParameters> {
  final BasePrescriptionRepository basePrescriptionRepository;

  UpdatePrescriptionUseCase(this.basePrescriptionRepository);

  @override
  Future<Either<Failure, Presccription>> call(
      PresccriptionParameters parameters) async {
    return await basePrescriptionRepository.updatePrescription(parameters);
  }
}
