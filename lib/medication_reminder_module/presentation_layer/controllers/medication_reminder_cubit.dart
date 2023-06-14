import '../../../core/utils/exports.dart';

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
  List days = [];
  List<Reminder>? allReminders;
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
  String? medicineTime;
  int index = 1;
  List timerController = [
    TextEditingController(),
  ];
  addTimer() {
    final controller = TextEditingController();
    timerController.add(controller);
    emit(AddTimerState());
    emit(ReminderDone());
  }

  List<String> allDays = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];
  void addNewDose() {
    index++;
    debugPrint('index $index');
    emit(AddNewDoseState());
    emit(ReminderDone());
  }

  void deleteDose() {
    index--;
    debugPrint('index $index');
    emit(DeleteDoseState());
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

  Future storeMedicationReminder(ReminderParameters parameters) async {
    emit(StoreReminderLoadingState());
    final result = await storeReminderUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error allergy ${l.message.toString()}');
        emit(
          StoreReminderErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        general = r;
        debugPrint(general.message);
        emit(StoreReminderSuccessState());
        getAllReminders();
        index = 1;
        timerController = [
          TextEditingController(),
        ];
        medicineTime = null;
      },
    );
  }

  Future updateReminder(ReminderParameters parameters) async {
    emit(UpdateReminderLoadingState());
    final result = await updateReminderUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error allergy ${l.message.toString()}');
        emit(
          UpdateReminderErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        general = r;
        emit(UpdateReminderSuccessState());
      },
    );
  }

  Future getAllReminders() async {
    emit(GetAllRemindersLoadingState());
    final result = await getAllMedicationReminderUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error allergy ${l.message.toString()}');
        emit(
          GetAllRemindersErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allReminders = r;
        debugPrint('all reminders cubit$allReminders');
        getAllDays();
        emit(GetAllRemindersSuccessState());
      },
    );
  }

  Future getSingleReminder(int id) async {
    emit(GetSingleReminderLoadingState());
    final result = await getSingleRminderUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error allergy ${l.message.toString()}');
        emit(
          GetSingleReminderErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        reminder = r;
        emit(GetSingleReminderSuccessState());
      },
    );
  }

  Future deleteReminders(int id) async {
    emit(DeleteReminderLoadingState());
    final result = await deleteReminderUseCase(id);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error reminder ${l.message.toString()}');
        emit(
          DeleteReminderErrorState(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        general = r;
        emit(DeleteReminderSuccessState());
        getAllReminders();
      },
    );
  }
}
