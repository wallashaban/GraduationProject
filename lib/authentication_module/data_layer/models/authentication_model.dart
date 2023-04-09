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
      id: json['data']['user']['id'],
      name: json['data']['user']['name'],
      email: json['data']['user']['email'],
      gender: json['data']['user']['gender'],
      birthDate: json['data']['user']['birth_date'],
      accessToken: json['data']['access_token'],
    );
  }
}
