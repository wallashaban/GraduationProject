import 'package:equatable/equatable.dart';

class MedicalnfoDetails extends Equatable {
 final String userName;
final  int userAgeInMonth;
final  String bloodType;
 final String allergy;
 final String skinDisease;
 final String chronicDisease;
 final String geneticDisease;
 final String isMedicine;
 final String medicineFile;
 const MedicalnfoDetails({
    required this.userName,
    required this.userAgeInMonth,
    required this.bloodType,
    required this.allergy,
    required this.skinDisease,
    required this.chronicDisease,
    required this.geneticDisease,
    required this.isMedicine,
    required this.medicineFile,
  });
  
  @override
  List<Object?> get props => [
    userName,
    userAgeInMonth,
    bloodType,
    skinDisease,
    allergy,
    chronicDisease,
    geneticDisease,
    isMedicine,
    medicineFile,
  ];
}
