import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';


class UpdateReminderUseCase implements BaseUseCase<Either, ReminderParameters> {
  final BaseMedicationReminderRepository baseMedicationReminderRepository;

  UpdateReminderUseCase(this.baseMedicationReminderRepository);

  @override
  Future<Either<Failure, General>> call(ReminderParameters parameters) async {
    return await baseMedicationReminderRepository.updateReminder(parameters);
  }
}
