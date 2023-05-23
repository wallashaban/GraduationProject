import 'package:graduation_project/medical_details_module/domain_layer/entites/medical_details.dart';

class MedicalDetailsModel extends MedicalDetails {
  const MedicalDetailsModel({
    required super.id,
    required super.userId,
    required super.bloodType,
    required super.allergy,
    required super.skinDisease,
    required super.genticDisease,
    required super.chronicDisease,
    required super.isMedicine,
    required super.medicineFile,
  });

  factory MedicalDetailsModel.fromJson(Map<String, dynamic> json) {
    return MedicalDetailsModel(
      id: json['id'],
      userId: json['user_id'],
      bloodType: json['blood_type'],
      allergy: json['allergy'],
      skinDisease: json['skin_disease'],
      genticDisease: json['genetic_disease'],
      chronicDisease: json['chronic_disease'],
      isMedicine: json['Is_medicine'],
      medicineFile: json['medicine_file'],
    );
  }
}
