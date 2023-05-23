import 'package:hive_flutter/adapters.dart';

part 'ai_disease_cach.g.dart';

@HiveType(typeId: 2)
class AiDisease extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String disease;
  @HiveField(2)
  String createdAt;
  @HiveField(3)
  String photo;
  @HiveField(4)
  String prediction;
  AiDisease({
    required this.id,
    required this.disease,
    required this.createdAt,
    required this.photo,
    required this.prediction,
  });
}
