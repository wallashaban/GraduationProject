import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';

class DeleteReminderUseCase implements BaseUseCase<Either, int> {
  final BaseMedicationReminderRepository baseMedicationReminderRepository;

  DeleteReminderUseCase(this.baseMedicationReminderRepository);

  @override
  Future<Either<Failure, General>> call(int id) async {
    return await baseMedicationReminderRepository.deleteReminder(id);
  }
}
