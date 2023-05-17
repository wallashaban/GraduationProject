
import '../../domain_layer/entities/notifications.dart';

class NotificationsModel extends Notifications {
  const NotificationsModel({
    required super.title,
    required super.type,
    required super.createdAt,
    required super.body,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      title: json['title'],
      type: json['type'],
      createdAt: json['created_at'],
      body: json['body'],
    );
  }
}
