part of 'prescription_cubit.dart';

abstract class PrescriptionState extends Equatable {
  const PrescriptionState();

  @override
  List<Object> get props => [];
}

class PrescriptionInitial extends PrescriptionState {}

/////////////////////////////////////////////////
// prescription

class StorePrescriptionSuccessState extends PrescriptionState {}
class StorePrescriptionLoadingState extends PrescriptionState {}
class StorePrescriptionErrorState extends PrescriptionState {
 final String error;
 const StorePrescriptionErrorState({
    required this.error,
  });
}
///////////////////////////////////
class GellAllPrescriptionSuccessState extends PrescriptionState {}
class GellAllPrescriptionLoadingState extends PrescriptionState {}
class GellAllPrescriptionErrorState extends PrescriptionState {
 final String error;
 const GellAllPrescriptionErrorState({
    required this.error,
  });
}
////////////////////////////////
class GetSinglePrescriptionSuccessState extends PrescriptionState {}
class GetSinglePrescriptionLoadingState extends PrescriptionState {}
class GetSinglePrescriptionErrorState extends PrescriptionState {
 final String error;
 const GetSinglePrescriptionErrorState({
    required this.error,
  });
}
////////////////////////////
class UpdatePrescriptionSuccessState extends PrescriptionState {}
class UpdatePrescriptionLoadingState extends PrescriptionState {}
class UpdatePrescriptionErrorState extends PrescriptionState {
 final String error;
 const UpdatePrescriptionErrorState({
    required this.error,
  });
}
///////////////////////////////////////
class DeletePrescriptionSuccessState extends PrescriptionState {}
class DeletePrescriptionLoadingState extends PrescriptionState {}
class DeletePrescriptionErrorState extends PrescriptionState {
 final String error;
 const DeletePrescriptionErrorState({
    required this.error,
  });
}
