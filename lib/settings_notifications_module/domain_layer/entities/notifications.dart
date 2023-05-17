import 'package:graduation_project/core/utils/exports.dart';

class Notifications extends Equatable {
 final String title;
 final String type;
 final String createdAt;
 final String body;
 const Notifications({
    required this.title,
    required this.type,
    required this.createdAt,
    required this.body,
  });
  
  @override
  List<Object?> get props => [
    title,
    body,
    type,
    createdAt,
  ];
}
