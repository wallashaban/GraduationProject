import 'package:graduation_project/core/utils/exports.dart';

class MedicalTeeth extends Equatable {
 final int id;
 final String name;
 const MedicalTeeth({
    required this.id,
    required this.name,
  });
  
  @override
  List<Object?> get props => [
    id,
    name,
  ];
}
