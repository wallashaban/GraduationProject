import 'package:hive_flutter/adapters.dart';
part 'user_data_cach.g.dart';

@HiveType(typeId: 10)
class UserDataCach extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String? gender;
  @HiveField(4)
  final String? birthDate;
  @HiveField(5)
  final String accessToken;
  @HiveField(6)
  final String? photo;
  @HiveField(7)
  final String? phone;
  UserDataCach({
    required this.id,
    required this.name,
    required this.email,
    this.gender,
    this.birthDate,
    required this.accessToken,
    this.photo,
    this.phone,
  });
}
