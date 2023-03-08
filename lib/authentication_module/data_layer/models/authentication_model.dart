import 'package:graduation_project/core/utils/exports.dart';

class AuthenticationModel extends Authentication {
  const AuthenticationModel({
    required super.id,
    required super.name,
    required super.email,
     super.gender,
     super.birthDate,
    required super.accessToken,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      gender: json['user']['gender'],
      birthDate: json['user']['birth_date'],
      accessToken: json['access_token'],
    );
  }
}
