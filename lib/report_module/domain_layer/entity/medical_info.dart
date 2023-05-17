// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:graduation_project/core/utils/exports.dart';

class MedicalInfo extends Equatable {
  final int userAgeMonth;
  final String userName;
  final String bloodType;
  final String? allergy;
  final String? skinDisease;
  final String? chronicDisease;
  final String? geneticDisease;
  final String? isMedicine;
  const MedicalInfo({
    required this.userAgeMonth,
    required this.userName,
    required this.bloodType,
     this.allergy,
     this.skinDisease,
     this.chronicDisease,
     this.geneticDisease,
     this.isMedicine,
  });

  @override
  List<Object?> get props => [
        userAgeMonth,
        userName,
        bloodType,
        allergy,
        skinDisease,
        chronicDisease,
        geneticDisease,
        isMedicine,
      ];
}
