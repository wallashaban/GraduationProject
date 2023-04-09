import '../../domain_layer/entities/medical_info_details.dart';

class MedicalInfoDetailsModel extends MedicalnfoDetails {
  const MedicalInfoDetailsModel({
    required super.userName,
    required super.userAgeInMonth,
    required super.bloodType,
    required super.allergy,
    required super.skinDisease,
    required super.chronicDisease,
    required super.geneticDisease,
    required super.isMedicine,
    required super.medicineFile,
  });

  factory MedicalInfoDetailsModel.fromJson(Map<String, dynamic> json) {
    return MedicalInfoDetailsModel(
      userName: json['username'],
      userAgeInMonth: json['userAgeInMonth'],
      bloodType: json['blood_type'],
      allergy: json['allergy'],
      skinDisease: json['skin_disease'],
      chronicDisease: json['chronic_disease'],
      geneticDisease: json['genetic_disease'],
      isMedicine: json['Is_medicine'],
      medicineFile: json['medicine_file'],
    );
  }
}
