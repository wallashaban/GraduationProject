
import '../../domain_layer/entity/latest_development.dart';

class LatestDevelopmentModel extends LatestDevelopment {
  const LatestDevelopmentModel({
    required super.question,
  });
  factory LatestDevelopmentModel.fromJson(Map<String, dynamic> json) {
    return LatestDevelopmentModel(
      question: json['questions'],
    );
  }
}
