import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../repository/settings_notifications_base_repo.dart';

class MakeReviewUseCase
    implements BaseUseCase<Either, String> {
  final SettingsNotificationsBaseRepository settingsNotificationsBaseRepository;

  MakeReviewUseCase(this.settingsNotificationsBaseRepository);

  @override
  Future<Either<Failure, General>> call(
      String message) async {
    return await settingsNotificationsBaseRepository.makeReview(message);
  }
}
