import 'package:equatable/equatable.dart';

class Allergy extends Equatable {
 final String allergy;
 const Allergy({
    required this.allergy,
  });
  
  @override
  List<Object?> get props => [
    allergy,
  ];
}
