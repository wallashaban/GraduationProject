
import '../../domain_layer/entities/teeth.dart';

class TeethModel extends Teeth {
  const TeethModel({
    required super.id,
    required super.apperenceDate,
    required super.ageInYears,
    required super.ageInMonths,
    required super.ageInDays,
    required super.teethName,
  });

  factory TeethModel.fromJson(Map<String, dynamic> json) {
    return TeethModel(
      id: json['id'],
      apperenceDate: json['apperance_date'],
      ageInYears: json['age_in_years'],
      ageInMonths: json['age_in_months'],
      ageInDays: json['age_in_days'],
      teethName: json['teeth'],
    );
  }
}
