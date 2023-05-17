import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';


abstract class BaseMedicationReminderRepository {
  Future<Either<Failure, List<Days>>> getAllDays();
  Future<Either<Failure, List<Reminder>>> getAllMedicationReminder();
  Future<Either<Failure, Reminder>> getSingleMedicationReminder(int id);
  Future<Either<Failure, General>> storeRemnider(ReminderParameters parameters);
  Future<Either<Failure, General>> updateReminder(
      ReminderParameters parameters);
  Future<Either<Failure, General>> deleteReminder(int id);
}


