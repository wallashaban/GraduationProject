// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graduation_project/core/utils/exports.dart';

class DiseaseReport extends Equatable {
  final String disease;
  final String createdAt;
  const DiseaseReport({
    required this.disease,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        disease,
        createdAt,
      ];
}
