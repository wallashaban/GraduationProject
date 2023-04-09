import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';

import '../../../core/error/failure.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../repository/base_prescription_repository.dart';

class DeletePrescriptionUseCase
    implements BaseUseCase<Either<Failure, General>, int> {
  final BasePrescriptionRepository basePrescriptionRepository;

  DeletePrescriptionUseCase(this.basePrescriptionRepository);

  @override
  Future<Either<Failure, General>> call(int id) async {
    return await basePrescriptionRepository.deletePrescriPtion(id);
  }
}
