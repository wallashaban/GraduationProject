import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';


class GetSingleMedicalTestUseCase
    implements
        BaseUseCase<Either<Failure, MediaclTest>, int> {
  final BaseMedicalTestsRepository baseMedicalTestsRepository;

  GetSingleMedicalTestUseCase(this.baseMedicalTestsRepository);

  @override
  Future<Either<Failure,MediaclTest>> call(
      int id) async {
    return await baseMedicalTestsRepository.getSingleMedicalTest(id);
  }
}
