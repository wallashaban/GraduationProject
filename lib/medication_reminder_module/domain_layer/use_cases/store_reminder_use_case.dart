import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';

class StoreReminderUseCase implements BaseUseCase<Either, ReminderParameters> {
  final BaseMedicationReminderRepository baseMedicationReminderRepository;

  StoreReminderUseCase(this.baseMedicationReminderRepository);

  @override
  Future<Either<Failure, General>> call(ReminderParameters parameters) async {
    return await baseMedicationReminderRepository.storeRemnider(parameters);
  }
}
