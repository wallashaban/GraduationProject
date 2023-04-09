
import '../../domain_layer/entites/allergy.dart';

class AllergyModel extends Allergy {
  const AllergyModel({required super.allergy});
  factory AllergyModel.fromJson(Map<String, dynamic> json) {
    return AllergyModel(
      allergy: json['allergy'],
    );
  }
}
