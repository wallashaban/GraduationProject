part of 'medical_cubit.dart';

abstract class MedicalState extends Equatable {
  const MedicalState();

  @override
  List<Object> get props => [];
}

class MedicalInitial extends MedicalState {}
class IsGeneticDiseaseState extends MedicalState{}
class IsMedicineState extends MedicalState{}
class ChangeBottomNavbatState extends MedicalState{}
class ChangeBloodTypeValueState extends MedicalState{}

class ChangeChronicDiseaseValueState extends MedicalState{}
class ChangeGeneticDiseaseValueState extends MedicalState{}
class ChangeAllergyValueState extends MedicalState{}

class Done extends MedicalState{}

/////////////////////////////////
///medical details

class StoreMedicalDetailsSuccessState extends MedicalState {}
class StoreMedicalDetailsLoadingState extends MedicalState {}
class StoreMedicalDetailsErrorState extends MedicalState {
 final String error;
 const StoreMedicalDetailsErrorState({
    required this.error,
  });
}
///////////////////////////////////
class GellAllAllergiesSuccessState extends MedicalState {}
class GellAllAllergiesLoadingState extends MedicalState {}
class GellAllAllergiesErrorState extends MedicalState {
 final String error;
 const GellAllAllergiesErrorState({
    required this.error,
  });
}
////////////////////////////////
class GetAllChronicSuccessState extends MedicalState {}
class GetAllChronicLoadingState extends MedicalState {}
class GetAllChronicErrorState extends MedicalState {
 final String error;
 const GetAllChronicErrorState({
    required this.error,
  });
}
////////////////////////////
class GetAllSkinDiseasesSuccessState extends MedicalState {}
class GetAllSkinDiseasesLoadingState extends MedicalState {}
class GetAllSkinDiseasesErrorState extends MedicalState {
 final String error;
 const GetAllSkinDiseasesErrorState({
    required this.error,
  });
}
///////////////////////////////////////
class GetAllGeneticDiseasesSuccessState extends MedicalState {}
class GetAllGeneticDiseasesLoadingState extends MedicalState {}
class GetAllGeneticDiseasesErrorState extends MedicalState {
 final String error;
 const GetAllGeneticDiseasesErrorState({
    required this.error,
  });
}

/////////////////////////////////////////////////
