import 'package:graduation_project/report_module/domain_layer/entity/medical_info.dart';

class MedicalInfoModel extends MedicalInfo {
  const MedicalInfoModel({
    required super.userAgeMonth,
    required super.userName,
    required super.bloodType,
     super.allergy,
     super.skinDisease,
     super.chronicDisease,
     super.geneticDisease,
     super.isMedicine,
  });
  factory MedicalInfoModel.fromJson(Map<String, dynamic> json) {
    return MedicalInfoModel(
      userName: json['username'],
      userAgeMonth: json['userAgeInMonth'],
      bloodType: json['blood_type'],
      allergy: json['allergy'],
      chronicDisease: json['chronic_disease'],
      geneticDisease: json['genetic_disease'],
      isMedicine: json['Is_medicine'],
      skinDisease: json['skin_disease'],
    );
  }
}
