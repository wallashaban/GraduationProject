
import 'package:graduation_project/core/utils/exports.dart';

class Authentication extends Equatable {
 final int id;
 final String name;
 final String email;
 final String? gender;
 final String? birthDate;
 final String accessToken;
 const Authentication({
    required this.id,
    required this.name,
    required this.email,
     this.gender,
     this.birthDate,
    required this.accessToken,
  });
  
  @override
  List<Object?> get props => [
    id,
    name,
    email,
    gender,
    birthDate,
    accessToken,
  ];
}
