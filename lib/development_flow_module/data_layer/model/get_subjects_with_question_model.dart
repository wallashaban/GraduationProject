
import '../../domain_layer/entity/subject_questions.dart';

class SubjectWithQuestionsModel extends SubjectWithQuestion {
  const SubjectWithQuestionsModel({
    required super.id,
    required super.question,
    required super.subject,
    required super.status,
  });
  factory SubjectWithQuestionsModel.fromJson(Map<String, dynamic> json) {
    return SubjectWithQuestionsModel(
      id: json['id'],
      question: json['question'],
      subject: json['subject'],
      status: json['status']
    );
  }
}
