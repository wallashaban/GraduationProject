// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graduation_project/core/utils/exports.dart';

class LatestTeeth extends Equatable {
  final String teeth;  
  final String ageInMonth;
  final String teethStatus;
  const LatestTeeth({
    required this.teeth,
    required this.ageInMonth,
    required this.teethStatus,
  });



  @override
  List<Object?> get props => [
        teeth,
        ageInMonth,
        teethStatus,
      ];
}
