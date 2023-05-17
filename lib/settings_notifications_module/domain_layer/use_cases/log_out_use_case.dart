import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../repository/settings_notifications_base_repo.dart';


class LogOutUseCase
    implements BaseUseCase<Either, NoParameters> {
  final SettingsNotificationsBaseRepository settingsNotificationsBaseRepository;

  LogOutUseCase(this.settingsNotificationsBaseRepository);

  @override
  Future<Either<Failure, General>> call(
      NoParameters parameters) async {
    return await settingsNotificationsBaseRepository.logOut();
  }
}
