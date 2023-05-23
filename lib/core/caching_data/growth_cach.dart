import 'package:hive/hive.dart';

part 'growth_cach.g.dart';

@HiveType(typeId: 6)
class GrowrhCach extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String height;
  @HiveField(2)
  String weight;
  @HiveField(3)
  String heightStatus;
  @HiveField(4)
  String weightStatus;
  @HiveField(5)
  String measureDate;
  GrowrhCach({
    required this.id,
    required this.height,
    required this.weight,
    required this.heightStatus,
    required this.weightStatus,
    required this.measureDate,
  });
}
