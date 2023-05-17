import '../../domain_layer/entities/vaccination_report.dart';

class VaccinationReportModel extends VaccinationReport {
  const VaccinationReportModel({
    required super.name,
    required super.preventions,
    required super.status,
  });

  factory VaccinationReportModel.fromJson(Map<String, dynamic> json) {
    return VaccinationReportModel(
      name: json['name'],
      preventions: json['prevention'],
      status: json['status'],
    );
  }
}
