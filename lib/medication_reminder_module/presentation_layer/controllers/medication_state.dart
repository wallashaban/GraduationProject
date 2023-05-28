part of 'medication_reminder_cubit.dart';

abstract class ReminderState extends Equatable {
  const ReminderState();

  @override
  List<Object> get props => [];
}

class ReminderInitial extends ReminderState {}
class ChangeRemnderTimeValueState extends ReminderState {}
class ChangeRemnderQuantityValueState extends ReminderState {}
class AddNewDoseState extends ReminderState{}
class DeleteDoseState extends ReminderState{}

class ReminderDone extends ReminderState {}
class AddTimerState extends ReminderState{}


class StoreReminderSuccessState extends ReminderState {}
class StoreReminderLoadingState extends ReminderState {}
class StoreReminderErrorState extends ReminderState {
 final String error;
 const StoreReminderErrorState({
    required this.error,
  });
}
///////////////////////////////////
class GetAllRemindersSuccessState extends ReminderState {}
class GetAllRemindersLoadingState extends ReminderState {}
class GetAllRemindersErrorState extends ReminderState {
 final String error;
 const GetAllRemindersErrorState({
    required this.error,
  });
}

///////////////////////////////////////////
class UpdateReminderSuccessState extends ReminderState {}
class UpdateReminderLoadingState extends ReminderState {}
class UpdateReminderErrorState extends ReminderState {
 final String error;
 const UpdateReminderErrorState({
    required this.error,
  });
}
///////////////////////////////////////////
class DeleteReminderSuccessState extends ReminderState {}
class DeleteReminderLoadingState extends ReminderState {}
class DeleteReminderErrorState extends ReminderState {
 final String error;
 const DeleteReminderErrorState({
    required this.error,
  });
}
////////////////////////////////////////////
class GetSingleReminderSuccessState extends ReminderState {}
class GetSingleReminderLoadingState extends ReminderState {}
class GetSingleReminderErrorState extends ReminderState {
 final String error;
 const GetSingleReminderErrorState({
    required this.error,
  });
}

///////////////////////////////////
class GetAllDaysSuccessState extends ReminderState {}
class GetAllDaysLoadingState extends ReminderState {}
class GetAllDaysErrorState extends ReminderState {
 final String error;
 const GetAllDaysErrorState({
    required this.error,
  });
}






