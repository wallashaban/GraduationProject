part of 'disease_cubit.dart';

abstract class DiseaseState extends Equatable {
  const DiseaseState();

  @override
  List<Object> get props => [];
}

class DiseaseInitial extends DiseaseState {}

class StoreDiseaseSuccessState extends DiseaseState {}
class StoreDiseaseLoadingState extends DiseaseState {}
class StoreDiseaseErrorState extends DiseaseState {
 final String error;
 const StoreDiseaseErrorState({
    required this.error,
  });
}


class ChangeBottomNavbatDiseaseState extends DiseaseState {}


class GetAllDiseaseSuccessState extends DiseaseState {}
class GetAllDiseaseLoadingState extends DiseaseState {}
class GetAllDiseaseErrorState extends DiseaseState {
 final String error;
 const GetAllDiseaseErrorState({
    required this.error,
  });
}
class DeleteDiseaseSuccessState extends DiseaseState {}
class DeleteDiseaseLoadingState extends DiseaseState {}
class DeleteDiseaseErrorState extends DiseaseState {
 final String error;
 const DeleteDiseaseErrorState({
    required this.error,
  });
}
class PickDiseaseImageSuccessState extends DiseaseState{}
class DiseaseDone extends DiseaseState{}
class DeleteImageSuccessState extends DiseaseState{}
class PredictDiseaseSuccessState extends DiseaseState {}
class PredictDiseaseLoadingState extends DiseaseState {}
class PredictDiseaseErrorState extends DiseaseState {
 final String error;
 const PredictDiseaseErrorState({
    required this.error,
  });
}
