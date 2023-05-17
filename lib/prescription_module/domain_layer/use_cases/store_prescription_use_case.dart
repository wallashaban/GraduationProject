import 'package:dartz/dartz.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../repository/base_prescription_repository.dart';

class StorePrescriptionUseCase
    implements
        BaseUseCase<Either<Failure, General>, PresccriptionParameters> {
  final BasePrescriptionRepository basePrescriptionRepository;

  StorePrescriptionUseCase(this.basePrescriptionRepository);

  @override
  Future<Either<Failure, General>> call(
      PresccriptionParameters parameters) async {
    return await basePrescriptionRepository.storePrescribtion(parameters);
  }
}
