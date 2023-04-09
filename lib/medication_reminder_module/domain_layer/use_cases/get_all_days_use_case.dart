import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

class GetAllDaysUseCase implements BaseUseCase<Either, NoParameters> {
  final BaseMedicationReminderRepository baseMedicationReminderRepository;

  GetAllDaysUseCase(this.baseMedicationReminderRepository);

  @override
  Future<Either<Failure, List<Days>>> call(NoParameters parameters) async {
    return await baseMedicationReminderRepository.getAllDays();
  }
}
