import 'package:graduation_project/core/utils/exports.dart';

class DevelopmentFlowState extends Equatable{
  @override
  List<Object?> get props => [];
}
class DevelopmentFlowInitialState extends DevelopmentFlowState{}
class AllTipsLoadingState extends DevelopmentFlowState{}
class AllTipsSuccessState extends DevelopmentFlowState{}
class AllTipsErrorState extends DevelopmentFlowState{
  final String error;
  AllTipsErrorState({
    required this.error,
  });
}
class FlowDone extends DevelopmentFlowState{}//neeeew
class QuestionsOfTipsLoadingState extends DevelopmentFlowState{}
class QuestionsOfTipsSuccessState extends DevelopmentFlowState{}
class QuestionsOfTipsErrorState extends DevelopmentFlowState{
  final String error;
  QuestionsOfTipsErrorState({
    required this.error,
  });
}

class SubjectsWithQuestionsLoadingState extends DevelopmentFlowState{}
class SubjectsWithQuestionsSuccessState extends DevelopmentFlowState{}
class SubjectsWithQuestionsErrorState extends DevelopmentFlowState{
  final String error;
  SubjectsWithQuestionsErrorState({
    required this.error,
  });
}

class CreateTipsLoadingState extends DevelopmentFlowState{}
class CreateTipsSuccessState extends DevelopmentFlowState{}
class CreateTipsErrorState extends DevelopmentFlowState{
  final String error;
  CreateTipsErrorState({
    required this.error,
  });
}

class UpdateTipsLoadingState extends DevelopmentFlowState{}
class UpdateTipsSuccessState extends DevelopmentFlowState{}
class UpdateTipsErrorState extends DevelopmentFlowState{
  final String error;
  UpdateTipsErrorState({
    required this.error,
  });
}

class showCheckboxSuccessState extends DevelopmentFlowState{}

class changeCheckboxSuccessState extends DevelopmentFlowState{}
