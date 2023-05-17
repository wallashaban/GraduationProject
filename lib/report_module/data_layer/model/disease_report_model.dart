import 'package:graduation_project/report_module/domain_layer/entity/disease_report.dart';

class DiseaseReportModel extends DiseaseReport {
  const DiseaseReportModel({
    required super.disease,
    required super.createdAt,
  });
  factory DiseaseReportModel.fromJson(Map<String, dynamic> json) {
    return DiseaseReportModel(
      disease: json['disease'],
      createdAt: json['created_at'],
    );
  }
}
