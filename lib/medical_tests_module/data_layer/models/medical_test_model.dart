
import 'package:graduation_project/medical_tests_module/domain_layer/entities/medical_test.dart';

class MediaclTestModel extends MediaclTest {
  const MediaclTestModel({
    required super.id,
    required super.labName,
    required super.type,
    required super.labDate,
    required super.labFile,
  });

  factory MediaclTestModel.fromJson(Map<String, dynamic> json) {
    return MediaclTestModel(
      id: json['id'],
      labName: json['lab_name'],
      type: json['type'],
      labDate: json['lab_date'],
      labFile: json['lab_file'],
    );
  }
}
