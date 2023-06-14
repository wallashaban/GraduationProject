import 'package:graduation_project/core/utils/exports.dart';

class AiDiseasee extends Equatable {
  final int id;
  final int? userId;
  final String prediction;
  final String disease;
  final String createdAt;
  final String photo;
  const AiDiseasee({
    required this.prediction,
    required this.disease,
    required this.photo,
    required this.createdAt,
    required this.id,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        prediction,
        createdAt,
        disease,
        userId,
        photo,
        id,
      ];
}
