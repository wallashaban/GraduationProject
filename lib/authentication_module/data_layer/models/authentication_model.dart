import '../../../core/utils/exports.dart';

class AuthenticationModel extends Authentication {
  const AuthenticationModel({
    required super.id,
    required super.name,
    required super.email,
     super.gender,
     super.birthDate,
    required super.accessToken,
    required super.isReminderVaccine,
    super.photo,
    super.phone,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      id: json['data']['user']['id'],
      name: json['data']['user']['name'],
      email: json['data']['user']['email'],
      gender: json['data']['user']['gender'],
      birthDate: json['data']['user']['birth_date'],
      accessToken: json['data']['access_token'],
      isReminderVaccine: json['data']['is_reminder_vaccine'],
      photo:json['data']['user']['photo'],
      phone: json['data']['user']['phone_number'],
    );
  }
}
