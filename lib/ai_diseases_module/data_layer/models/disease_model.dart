import 'package:graduation_project/ai_diseases_module/domain_layer/entities/disease.dart';

class AiDiseaseModel extends AiDisease {
 const AiDiseaseModel({
    required super.prediction,
    required super.disease,
    required super.photo,
    required super.createdAt,
    required super.id,
  });

  factory AiDiseaseModel.fromJson(Map<String, dynamic> json) {
    return AiDiseaseModel(
      prediction: json['prediction'],
      createdAt: json['created_at'],
      disease: json['disease'],
      photo: json['photo'],
      id: json['id'],

    );
  }
}
