import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';


class StoreMedicalDetailsUseCase
    implements
        BaseUseCase<Either<Failure, General>, StoreMedicalDetailsParameters> {
  final BaseMedicalDetailsRepository baseMedicalRepository;

  StoreMedicalDetailsUseCase(this.baseMedicalRepository);

  @override
  Future<Either<Failure, General>> call(
      StoreMedicalDetailsParameters parameters) async {
    return await baseMedicalRepository.storeMedicalDetails(parameters);
  }
}
