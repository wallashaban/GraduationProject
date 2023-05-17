import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../entities/notifications.dart';
import '../repository/settings_notifications_base_repo.dart';


class GetHistoryNotificationsUseCase
    implements BaseUseCase<Either, NoParameters> {
  final SettingsNotificationsBaseRepository settingsNotificationsBaseRepository;

  GetHistoryNotificationsUseCase(this.settingsNotificationsBaseRepository);

  @override
  Future<Either<Failure, List<Notifications>>> call(
      NoParameters parameters) async {
    return await settingsNotificationsBaseRepository.getHistoryOfNotifications();
  }
}
