import 'package:graduation_project/development_flow_module/domain_layer/entity/all_tips.dart';

class AllTipsModel extends AllTips {
  const AllTipsModel({
    required super.id,
    required super.description,
    required super.ageStage,
    required super.date,
    required super.unanweredQuestions,
  });
  factory AllTipsModel.fromJson(Map<String, dynamic> json) {
    return AllTipsModel(
      id: json['id'],
      description: json['description'],
      ageStage: json['age_stage'],
      date: json['date'],
      unanweredQuestions: List<UnasweredQuestionsModel>.from((json['unAnswerQuestions'])
          .map((e) => UnasweredQuestionsModel.fromJson(e))
          .toList()),
    );
  }
}

class UnasweredQuestionsModel extends UnansweredQuestions {
  const UnasweredQuestionsModel({required super.question});
  factory UnasweredQuestionsModel.fromJson(Map<String, dynamic> json) {
    return UnasweredQuestionsModel(
      question: json['question'],
    );
  }
}
