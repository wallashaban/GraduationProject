import 'package:graduation_project/vaccinations_module/domain_layer/entities/vaccination.dart';

class VaccinationModel extends Vaccination {
  const VaccinationModel({
    required super.id,
    required super.name,
    required super.vaccineAge,
    required super.prevention,
    required super.status,
    required super.proposedVaccinationDate,
  });

  factory VaccinationModel.fromJson(Map<String, dynamic> json) {
    return VaccinationModel(
      id: json['id'],
      name: json['name'],
      vaccineAge: json['vaccine_age'],
      prevention: json['prevention'],
      status: json['status'],
      proposedVaccinationDate: json['proposed_vaccination_date'],
    );
  }
}
