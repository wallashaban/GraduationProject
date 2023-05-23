import 'package:hive_flutter/adapters.dart';
part 'medical_details_cach.g.dart';
@HiveType(typeId: 1)
class MedicalDetailsCach extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  int userId;
  @HiveField(2)
  String bloodType;
  @HiveField(3)
  String? allergy;
  @HiveField(4)
  String? skinDisease;
  @HiveField(5)
  String? chronicDisease;
  @HiveField(6)
  String? genticDisease;
  @HiveField(7)
  bool? isMedicine;
  @HiveField(8)
  String? medicineFile;
  @HiveField(9)
  bool? isGenticDisease;
  MedicalDetailsCach({
    required this.id,
    required this.userId,
    required this.bloodType,
    required this.allergy,
    required this.skinDisease,
    required this.chronicDisease,
    required this.genticDisease,
    required this.isMedicine,
    required this.medicineFile,
    required this.isGenticDisease,
  });
  
}
