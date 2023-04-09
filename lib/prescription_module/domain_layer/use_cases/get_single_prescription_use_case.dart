import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/prescribtion.dart';
import '../repository/base_prescription_repository.dart';

class GetSinglePrescriptionUseCase
    implements
        BaseUseCase<Either<Failure, Presccription>, int> {
  final BasePrescriptionRepository basePrescriptionRepository;

  GetSinglePrescriptionUseCase(this.basePrescriptionRepository);

  @override
  Future<Either<Failure, Presccription>> call(
      int id) async {
    return await basePrescriptionRepository.getSinglePrescription(id);
  }
}
