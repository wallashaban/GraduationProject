import 'dart:io';

import 'package:equatable/equatable.dart';

class MediaclTest extends Equatable {
 final int id;
 final String labName;
 final String type;
 final String labDate;

 final File labFile;
 const MediaclTest({
    required this.id,
    required this.labName,
    required this.type,
    required this.labDate,
    required this.labFile,
  });
  
  @override
  List<Object?> get props => [
    id,
    labName,
    labDate,
    labFile,
    type,
  ];
}
