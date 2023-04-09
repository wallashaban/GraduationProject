import 'package:equatable/equatable.dart';

class Disease extends Equatable {
 final String disease;
 const Disease({
    required this.disease,
  });
  
  @override
  List<Object?> get props => [
    disease,
  ];
}
