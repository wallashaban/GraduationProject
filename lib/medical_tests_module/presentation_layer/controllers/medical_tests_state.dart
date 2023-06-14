//part of 'medical_cubit.dart';

import '../../../core/utils/exports.dart';

abstract class MedicalTestsState extends Equatable {
  const MedicalTestsState();

  @override
  List<Object> get props => [];
}

class MedicalTestsInitial extends MedicalTestsState {}
class PickImageSuccessState extends MedicalTestsState {}
class Cansel extends MedicalTestsState{}
class TestDone extends MedicalTestsState {}
class ChangeDateState extends MedicalTestsState {}

///medical test

class StoreMedicaltestSuccessState extends MedicalTestsState {}
class StoreMedicaltestLoadingState extends MedicalTestsState {}
class StoreMedicaltestErrorState extends MedicalTestsState {
 final String error;
 const StoreMedicaltestErrorState({
    required this.error,
  });
}
///////////////////////////////////
class GellAllMedicaltestSuccessState extends MedicalTestsState {}
class GellAllMedicaltestLoadingState extends MedicalTestsState {}
class GellAllMedicaltestErrorState extends MedicalTestsState {
 final String error;
 const GellAllMedicaltestErrorState({
    required this.error,
  });
}
////////////////////////////////
class GetSingleMedicaltestSuccessState extends MedicalTestsState {}
class GetSingleMedicaltestLoadingState extends MedicalTestsState {}
class GetSingleMedicaltestErrorState extends MedicalTestsState {
 final String error;
 const GetSingleMedicaltestErrorState({
    required this.error,
  });
}
////////////////////////////
class UpdateMedicaltestSuccessState extends MedicalTestsState {}
class UpdateMedicaltestLoadingState extends MedicalTestsState {}
class UpdateMedicaltestErrorState extends MedicalTestsState {
 final String error;
 const UpdateMedicaltestErrorState({
    required this.error,
  });
}
///////////////////////////////////////
class DeleteMedicaltestSuccessState extends MedicalTestsState {}
class DeleteMedicaltestLoadingState extends MedicalTestsState {}
class DeleteMedicaltestErrorState extends MedicalTestsState {
 final String error;
 const DeleteMedicaltestErrorState({
    required this.error,
  });
}
/////////////////////////////////////////////////