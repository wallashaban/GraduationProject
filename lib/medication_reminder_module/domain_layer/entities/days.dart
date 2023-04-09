import 'package:graduation_project/core/utils/exports.dart';

class Days extends Equatable {
 final int id;
 final String day;
 const Days({
    required this.id,
    required this.day,
  });
  
  @override
  List<Object?> get props => [
    id,
    day,
  ];
}
