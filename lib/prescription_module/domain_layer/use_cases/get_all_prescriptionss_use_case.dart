import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/prescribtion.dart';
import '../repository/base_prescription_repository.dart';

class GetAllPrescriptionsUseCase
    implements
        BaseUseCase<Either<Failure, List<Presccription>>, NoParameters> {
  final BasePrescriptionRepository basePrescriptionRepository;

  GetAllPrescriptionsUseCase(this.basePrescriptionRepository);

  @override
  Future<Either<Failure, List<Presccription>>> call(
      NoParameters parameters) async {
    return await basePrescriptionRepository.getAllPrescriptions();
  }
}
