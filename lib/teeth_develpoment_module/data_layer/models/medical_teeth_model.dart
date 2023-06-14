import '../../domain_layer/entities/medical_teeth.dart';

class MedicalTeethModel extends MedicalTeeth {
  const MedicalTeethModel({
    required super.id,
    required super.name,
  });
  factory MedicalTeethModel.fromJson(Map<String, dynamic> json) {
    return MedicalTeethModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
