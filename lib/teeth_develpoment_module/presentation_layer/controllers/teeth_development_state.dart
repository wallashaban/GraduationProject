part of 'teeth_development_cubit.dart';

abstract class TeethDevelopmentState extends Equatable {
  const TeethDevelopmentState();

  @override
  List<Object> get props => [];
}

class TeethDevelopmentInitial extends TeethDevelopmentState {}

/// teeth development

class StoreTeethSuccessState extends TeethDevelopmentState {}
class StoreTeethLoadingState extends TeethDevelopmentState {}
class StoreTeethErrorState extends TeethDevelopmentState {
 final String error;
 const StoreTeethErrorState({
    required this.error,
  });
}
///////////////////////////////////
class GellAllTeethSuccessState extends TeethDevelopmentState {}
class GellAllTeethLoadingState extends TeethDevelopmentState {}
class GellAllTeethErrorState extends TeethDevelopmentState {
 final String error;
 const GellAllTeethErrorState({
    required this.error,
  });
}
////////////////////////////////
class GetSingleTeethSuccessState extends TeethDevelopmentState {}
class GetSingleTeethLoadingState extends TeethDevelopmentState {}
class GetSingleTeethErrorState extends TeethDevelopmentState {
 final String error;
 const GetSingleTeethErrorState({
    required this.error,
  });
}
////////////////////////////
class UpdateTeethSuccessState extends TeethDevelopmentState {}
class UpdateTeethLoadingState extends TeethDevelopmentState {}
class UpdateTeethErrorState extends TeethDevelopmentState {
 final String error;
 const UpdateTeethErrorState({
    required this.error,
  });
}
///////////////////////////////////////
class DeleteTeethSuccessState extends TeethDevelopmentState {}
class DeleteTeethLoadingState extends TeethDevelopmentState {}
class DeleteTeethErrorState extends TeethDevelopmentState {
 final String error;
 const DeleteTeethErrorState({
    required this.error,
  });
}

/////////////////////////////////////////////////

class ChangeToothNameValueState extends TeethDevelopmentState{}
class TeethDone extends TeethDevelopmentState{}