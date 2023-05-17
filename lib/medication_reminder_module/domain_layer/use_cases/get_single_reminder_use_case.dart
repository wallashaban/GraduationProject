import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';

class GetSingleRminderUseCase implements BaseUseCase<Either, int> {
  final BaseMedicationReminderRepository baseMedicationReminderRepository;

  GetSingleRminderUseCase(this.baseMedicationReminderRepository);

  @override
  Future<Either<Failure, Reminder>> call(int id) async {
    return await baseMedicationReminderRepository.getSingleMedicationReminder(id);
  }
}
