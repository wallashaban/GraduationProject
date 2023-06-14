import 'package:graduation_project/development_flow_module/domain_layer/entity/get_all_tips.dart';

class AllTipsModel extends AllTips {
  const AllTipsModel({
    required super.id,
    required super.description,
    required super.ageStage,
  });
  factory AllTipsModel.fromJson(Map<String, dynamic> json) {
    return AllTipsModel(
      id: json['id'],
      description: json['description'],
      ageStage: json['age_stage'],
    );
  }
}
