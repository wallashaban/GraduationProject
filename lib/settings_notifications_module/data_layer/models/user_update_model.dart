import '../../../core/utils/exports.dart';

class UserUpdateModel extends Authentication {
  const UserUpdateModel({
    required super.id,
    required super.name,
    required super.email,
    super.gender,
    super.birthDate,
    required super.isReminderVaccine,
    super.accessToken,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateModel(
        id: json['data']['id'],
        name: json['data']['name'],
        email: json['data']['email'],
        gender: json['data']['gender'],
        birthDate: json['data']['birth_date'],
        isReminderVaccine: json['data']['is_reminder_vaccine']);
  }
}
