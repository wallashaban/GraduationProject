import 'package:graduation_project/core/utils/exports.dart';

class RangeGrowth extends Equatable {
 final double heightEnd;
 final double heightStart;
 final double weightEnd;
 final double weightStart;
 const RangeGrowth({
    required this.heightEnd,
    required this.heightStart,
    required this.weightEnd,
    required this.weightStart,
  });
  
  @override
  List<Object?> get props => [
    heightStart,
    heightEnd,
    weightStart,
    weightEnd,
  ];
}
