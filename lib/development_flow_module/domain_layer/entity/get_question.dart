// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graduation_project/core/utils/exports.dart';

class QuestionsOfTip extends Equatable {
  final int id;
  final String question;
  final String subject;
  final int status;
  const QuestionsOfTip({
    required this.id,
    required this.question,
    required this.subject,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        status,
        subject,
      ];
}
