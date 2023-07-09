import 'package:graduation_project/core/utils/exports.dart';

class AllTips extends Equatable {
  final int id;
  final String description;
  final String ageStage;
  final String date;
  final List<UnansweredQuestions> unanweredQuestions;
  const AllTips({
    required this.id,
    required this.description,
    required this.ageStage,
    required this.date,
    required this.unanweredQuestions,
  });
  @override
  List<Object?> get props => [
        id,
        description,
        ageStage,
        date,
        unanweredQuestions,
      ];
}

class UnansweredQuestions extends Equatable {
  final String question;
  const UnansweredQuestions({
    required this.question,
  });

  @override
  List<Object?> get props => [
        question,
      ];
}
