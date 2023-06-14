import 'package:graduation_project/core/utils/exports.dart';

class AllTips extends Equatable {
  final int id;
  final String description;
  final String ageStage;

  const AllTips({
    required this.id,
    required this.description,
    required this.ageStage,
  });
  @override
  List<Object?> get props => [
        id,
        description,
        ageStage,
      ];
}
