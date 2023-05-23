import '../../../core/utils/exports.dart';

class Authentication extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? gender;
  final String? birthDate;
  final String? accessToken;
  final int? isReminderVaccine;
  final String? photo;
  final String? phone;
  const Authentication({
    required this.id,
    required this.name,
    required this.email,
    this.gender,
    this.birthDate,
    required this.accessToken,
    required this.isReminderVaccine,
    this.photo,
    this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        gender,
        photo,
        phone,
        birthDate,
        accessToken,

      ];
}
