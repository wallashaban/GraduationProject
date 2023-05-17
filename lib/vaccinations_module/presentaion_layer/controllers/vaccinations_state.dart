part of 'vaccinations_cubit.dart';

abstract class VaccinationsState extends Equatable {
  const VaccinationsState();

  @override
  List<Object> get props => [];
}

class VaccinationsInitial extends VaccinationsState {}

class ShowMessageSuccessState extends VaccinationsState{}
class ChangeDialogSuccessState extends VaccinationsState{}


class AttatchVaccinationSuccessState extends VaccinationsState {}
class AttatchVaccinationLoadingState extends VaccinationsState {}
class AttatchVaccinationErrorState extends VaccinationsState {
 final String error;
 const AttatchVaccinationErrorState({
    required this.error,
  });
}
///////////////////////////////////
class GetAllVaccinationsSuccessState extends VaccinationsState {}
class GetAllVaccinationsLoadingState extends VaccinationsState {}
class GetAllVaccinationsErrorState extends VaccinationsState {
 final String error;
 const GetAllVaccinationsErrorState({
    required this.error,
  });
}

///////////////////////////////////////////
class StopOrActiveVaccinationSuccessState extends VaccinationsState {}
class StopOrActiveVaccinationLoadingState extends VaccinationsState {}
class StopOrActiveVaccinationErrorState extends VaccinationsState {
 final String error;
 const StopOrActiveVaccinationErrorState({
    required this.error,
  });
}
///////////////////////////////////////////

class GetSingleVaccinationSuccessState extends VaccinationsState {}
class GetSingleVaccinationLoadingState extends VaccinationsState {}
class GetSingleVaccinationErrorState extends VaccinationsState {
 final String error;
 const GetSingleVaccinationErrorState({
    required this.error,
  });
}








