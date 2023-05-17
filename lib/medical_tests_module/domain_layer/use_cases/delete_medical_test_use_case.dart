import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';


class DeleteMedicalTestUseCase
    implements
        BaseUseCase<Either<Failure, General>, int> {
  final BaseMedicalTestsRepository baseMedicalTestsRepository;

  DeleteMedicalTestUseCase(this.baseMedicalTestsRepository);

  @override
  Future<Either<Failure, General>> call(
      int id) async {
    return await baseMedicalTestsRepository.deleteMedicalTest(id);
  }
}
