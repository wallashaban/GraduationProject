import 'package:graduation_project/core/utils/exports.dart';

part 'medication_state.dart';

class MedicationReminderCubit extends Cubit<ReminderState> {
  final StoreReminderUseCase storeReminderUseCase;
  final UpdateReminderUseCase updateReminderUseCase;
  final GetAllDaysUseCase getAllDaysUseCase;
  final GetAllMedicationReminderUseCase getAllMedicationReminderUseCase;
  final GetSingleRminderUseCase getSingleRminderUseCase;
  final DeleteReminderUseCase deleteReminderUseCase;
  MedicationReminderCubit(
    this.storeReminderUseCase,
    this.updateReminderUseCase,
    this.getAllDaysUseCase,
    this.getAllMedicationReminderUseCase,
    this.getSingleRminderUseCase,
    this.deleteReminderUseCase,
  ) : super(ReminderInitial());

  General general = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );
  List<Days> days = [];
  List<Reminder> allReminders = [];
  Reminder reminder = const ReminderModel(
    id: 1,
    reminderName: 'reminderName',
    startDate: 'startDate',
    endDate: 'endDate',
    apponitment: 'apponitment',
    times: [],
    days: [],
  );
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );

  List<String> medicineTimes = [
    'يوميا',
    'اسبوعيا',
    'شهريا',
  ];
  List<String> quantities = [
    '1',
    '2',
    '3',
  ];
  String? quantity;
  String? medicineTime;
  void changeReminderQuantityValue(String quantity) {
    this.quantity = quantity;
    emit(ChangeRemnderQuantityValueState());
    emit(ReminderDone());
  }
  void changeReminderTimeValue(String medicineTime) {
    this.medicineTime = medicineTime;
    emit(ChangeRemnderTimeValueState());
    emit(ReminderDone());
  }

  Future getAllDays() async {
    emit(GetAllDaysLoadingState());
    final result = await getAllDaysUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error allergy ${l.message.toString()}');
        emit(
          GetAllDaysErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        days = r;
        emit(GetAllDaysSuccessState());
      },
    );
  }
}
