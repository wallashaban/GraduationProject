import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

class GetAllMedicationReminderUseCase implements BaseUseCase<Either, NoParameters> {
  final BaseMedicationReminderRepository baseMedicationReminderRepository;

  GetAllMedicationReminderUseCase(this.baseMedicationReminderRepository);

  @override
  Future<Either<Failure, List<Reminder>>> call(NoParameters parameters) async {
    return await baseMedicationReminderRepository.getAllMedicationReminder();
  }
}
