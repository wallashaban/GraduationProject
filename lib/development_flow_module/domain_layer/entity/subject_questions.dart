// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graduation_project/core/utils/exports.dart';

class SubjectWithQuestion extends Equatable {
  final int id;
  final String question;
  final String subject;
  final int status;
  const SubjectWithQuestion({
    required this.id,
    required this.question,
    required this.subject,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        subject,
        status,
      ];

  SubjectWithQuestion copyWith({
    int? id,
    String? question,
    String? subject,
    int? status,
  }) {
    return SubjectWithQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      subject: subject ?? this.subject,
      status: status ?? this.status,
    );
  }
}
