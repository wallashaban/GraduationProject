import 'dart:convert';

import 'package:graduation_project/core/utils/exports.dart';

class MedicalDetails extends Equatable {
 final int id;
 final int userId;
 final String bloodType;
 final String? allergy;
 final String? skinDisease;
 final String? genticDisease;
 final String? chronicDisease;
 final String? isMedicine;
 const MedicalDetails({
    required this.id,
    required this.userId,
    required this.bloodType,
    required this.allergy,
    required this.skinDisease,
    required this.genticDisease,
    required this.chronicDisease,
    required this.isMedicine,
  });
  
  @override
  List<Object?> get props => [
    id,
    userId,
    allergy,
    isMedicine,
    skinDisease,
    genticDisease,
    chronicDisease,
  ];
}
