
// ignore_for_file: file_names

import 'package:hive/hive.dart';

part 'teeth_cach .g.dart';

@HiveType(typeId: 3)
class TeethCach extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String teeth;
  @HiveField(2)
  String appearanceDate;
  @HiveField(3)
  String ageInMonth;
  @HiveField(4)
  String ageInYears;
  TeethCach({
    required this.id,
    required this.teeth,
    required this.appearanceDate,
    required this.ageInMonth,
    required this.ageInYears,
  });
  
}
