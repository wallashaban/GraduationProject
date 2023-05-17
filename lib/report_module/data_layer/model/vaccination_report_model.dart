import 'package:graduation_project/report_module/domain_layer/entity/vaccination_report.dart';

class VaccinationReportModel extends VaccinationReport {
  const VaccinationReportModel({
    required super.status,
    required super.name,
    required super.prevention,
  });
  factory VaccinationReportModel.fromJson(Map<String, dynamic> json) {
    return VaccinationReportModel(
      status: json['status'],
      name: json['name'],
      prevention: json['prevention'],
    );
  }
}
