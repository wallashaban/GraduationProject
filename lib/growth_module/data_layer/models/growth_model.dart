import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';

class GrowthModel extends Growth {
  const GrowthModel({
    required super.id,
    required super.height,
    required super.weight,
    required super.heightStatus,
    required super.weightStatus,
    required super.measureDate,
  });

  factory GrowthModel.fromJson(Map<String, dynamic> json) {
    return GrowthModel(
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
      heightStatus: json['height_status'],
      weightStatus: json['weight_status'],
      measureDate: json['measure_date'],
    );
  }
}
