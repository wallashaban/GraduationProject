
import '../../domain_layer/entites/disease.dart';

class DiseaseModel extends Disease {
  const DiseaseModel({required super.disease});
  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      disease: json['disease'],
    );
  }
}
