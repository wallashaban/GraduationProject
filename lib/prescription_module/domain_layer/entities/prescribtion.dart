import 'dart:io';

import 'package:equatable/equatable.dart';

class Presccription extends Equatable{
 final int id;
 final String note;
 final String date;
 final File file;
 const Presccription({
    required this.id,
    required this.note,
    required this.date,
    required this.file,
  });
  
  @override
  List<Object?> get props => [
    id,
    note,
    date,
    file,
  ];
}
