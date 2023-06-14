import 'package:equatable/equatable.dart';

class Teeth extends Equatable {
  final int id;
  final String apperenceDate;
  final String teethName;
  final dynamic ageInYears;
  final dynamic ageInMonths;
  final String? ageInDays;
  const Teeth({
    required this.id,
    required this.apperenceDate,
    required this.ageInYears,
    required this.ageInMonths,
    required this.ageInDays,
    required this.teethName,
  });

  @override
  List<Object?> get props => [
        id,
        apperenceDate,
        teethName,
        ageInYears,
        ageInMonths,
        ageInDays,
      ];
}
