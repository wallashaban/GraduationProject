
import 'package:graduation_project/report_module/domain_layer/entity/latest_teeth.dart';


class LatestTeethModel extends LatestTeeth {
  const LatestTeethModel({
    required super.teeth,
    required super.ageInMonth,
    required super.teethStatus,
  });
  factory LatestTeethModel.fromJson(Map<String, dynamic> json) {
    return LatestTeethModel(
      teeth: json['teeth'],
      ageInMonth: json['age_in_months'],
      teethStatus: json['status'],

    );
  }
}
