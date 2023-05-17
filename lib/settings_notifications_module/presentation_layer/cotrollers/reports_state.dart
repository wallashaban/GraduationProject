
import 'package:equatable/equatable.dart';

abstract class SettingsNotificationsState extends Equatable {
  const SettingsNotificationsState();

  @override
  List<Object> get props => [];
}

class SettingsNotificationsInitial extends SettingsNotificationsState {}

class UpdateUserInfoLoadingState extends SettingsNotificationsState {}

class UpdateUserInfoSuccessState extends SettingsNotificationsState {}

class UpdateUserInfoErrorState extends SettingsNotificationsState {
 final String error;
 const UpdateUserInfoErrorState({
    required this.error,
  });

  
}

class LogOutSuccessState extends SettingsNotificationsState {}

class LogOutErrorState extends SettingsNotificationsState {
 final String error;
 const LogOutErrorState({
    required this.error,
  });

  
}

class MakeReviewSuccessState extends SettingsNotificationsState {}
class MakeReviewLoadingState extends SettingsNotificationsState {}

class MakeReviewErrorState extends SettingsNotificationsState {
 final String error;
 const MakeReviewErrorState({
    required this.error,
  });

  
}


class GetAllNotificationsLoadingState extends SettingsNotificationsState {}

class GetAllNotificationsSuccessState extends SettingsNotificationsState {}

class GetAllNotificationsErrorState extends SettingsNotificationsState {
 final String error;
 const GetAllNotificationsErrorState({
    required this.error,
  });

  
}

class NotificationSuccess extends SettingsNotificationsState{}