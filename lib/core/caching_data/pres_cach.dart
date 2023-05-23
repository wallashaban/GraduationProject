
import 'package:hive/hive.dart';

part 'pres_cach.g.dart';

@HiveType(typeId: 4)
class PresCach extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String? note;
  @HiveField(2)
  String date;
  @HiveField(3)
  String file;
  PresCach({
    required this.id,
    required this.note,
    required this.date,
    required this.file,
  });
  
}
