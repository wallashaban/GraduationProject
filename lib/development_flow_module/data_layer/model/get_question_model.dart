import 'package:graduation_project/development_flow_module/domain_layer/entity/get_question.dart';

class QuestionsOfTipModel extends QuestionsOfTip {
  const QuestionsOfTipModel({
    required super.id,
    required super.question,
    required super.subject,
    required super.status,
  });
  factory QuestionsOfTipModel.fromJson(Map<String, dynamic> json) {
    return QuestionsOfTipModel(
      id: json['id'],
      question: json['question'],
      subject: json['subject'],
      status: json['status'],
    );
  }
}
