import 'package:graduation_project/core/utils/exports.dart';

class AiDisease extends Equatable {
  final int id;
  final String prediction;
  final String disease;
  final String createdAt;
  final String photo;
  const AiDisease({
    required this.prediction,
    required this.disease,
    required this.photo,
    required this.createdAt,
    required this.id,
  });

  @override
  List<Object?> get props => [
        prediction,
        createdAt,
        disease,
        photo,
        id,
      ];
}
