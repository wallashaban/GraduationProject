part of 'growth_cubit.dart';

abstract class GrowthState extends Equatable {
  const GrowthState();

  @override
  List<Object> get props => [];
}

class GrowthInitial extends GrowthState {}

class EditGrowthLoadingSatate extends GrowthState {}

class EditGrowthSuccessSatate extends GrowthState {}

class EditGrowthErrorSatate extends GrowthState {
 final String error;
 const EditGrowthErrorSatate({
    required this.error,
  });
}

class ClaculateGrowthLoadingSatate extends GrowthState {}

class ClaculateGrowthSuccessSatate extends GrowthState {}

class ClaculateGrowthErrorSatate extends GrowthState {
 final String error;
 const ClaculateGrowthErrorSatate({
    required this.error,
  });
}

class GetRangeGrowthLoadingSatate extends GrowthState {}

class GetRangeGrowthSuccessSatate extends GrowthState {}

class GetRangeGrowthErrorSatate extends GrowthState {
 final String error;
 const GetRangeGrowthErrorSatate({
    required this.error,
  });
}

class GetAllGrowthLoadingSatate extends GrowthState {}

class GetAllGrowthSuccessSatate extends GrowthState {}

class GetAllGrowthErrorSatate extends GrowthState {
 final String error;
 const GetAllGrowthErrorSatate({
    required this.error,
  });
}

