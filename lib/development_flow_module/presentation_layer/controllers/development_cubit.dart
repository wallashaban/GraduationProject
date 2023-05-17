import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'development_state.dart';

class DevelopmentFlowCubit extends Cubit<DevelopmentFlowState> {
  DevelopmentFlowCubit() : super(DevelopmentFlowInitial());
}
