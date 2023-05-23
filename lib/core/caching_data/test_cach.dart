
import 'package:hive/hive.dart';

part 'test_cach.g.dart';

@HiveType(typeId: 5)
class TestCach extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String labName;
  @HiveField(2)
  String labFile;
  @HiveField(3)
  String labDate;
  @HiveField(4)
  String type;
  TestCach({
    required this.id,
    required this.labName,
    required this.labFile,
    required this.labDate,
    required this.type,
  });
  
}
