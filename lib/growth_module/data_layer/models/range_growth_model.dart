import '../../domain_layer/entities/range_growth.dart';

class RangeGrowthModel extends RangeGrowth {
  const RangeGrowthModel({
    required super.heightEnd,
    required super.heightStart,
    required super.weightEnd,
    required super.weightStart,
  });
  factory RangeGrowthModel.fromJson(Map<String, dynamic> json) {
    return RangeGrowthModel(
      heightEnd: json['height_end'].toDouble(),
      heightStart: json['height_start'].toDouble(),
      weightEnd: json['weight_end'].toDouble(),
      weightStart: json['weight_start'].toDouble(),
    );
  }
}
