import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../entities/notifications.dart';

abstract class SettingsNotificationsBaseRepository {
  Future<Either<Failure, Authentication>> updateUserInfo(
      RegisterUserParameters parameters);
  Future<Either<Failure, General>> logOut();
  Future<Either<Failure, General>> makeReview(String message);
  Future<Either<Failure, List<Notifications>>> getHistoryOfNotifications();
}
