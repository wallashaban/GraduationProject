import 'package:dartz/dartz.dart';
import 'package:graduation_project/settings_notifications_module/data_layer/data_source/settings_notifications_remote_data_source.dart';
import 'package:graduation_project/settings_notifications_module/domain_layer/entities/notifications.dart';
import '../../../core/utils/exports.dart';
import '../../domain_layer/repository/settings_notifications_base_repo.dart';

class SettingsNotificationsRepository implements SettingsNotificationsBaseRepository {
  final BaseSettingsNotificationsRemotDataSource baseSettingsNotificationsRemotDataSource;

  SettingsNotificationsRepository(this.baseSettingsNotificationsRemotDataSource);

 /*  @override
  Future<Either<Failure, Authentication>> updateUserInfo(
      RegisterUserParameters parameters) async {
    
    try {
      final result = await baseSettingsNotificationsRemotDataSource.updateUserInfo(
      parameters,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  } */
  
  @override
  Future<Either<Failure, General>> logOut() async{
     try {
      final result = await baseSettingsNotificationsRemotDataSource.logOut(
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, General>> makeReview(String message) async{
     try {
      final result = await baseSettingsNotificationsRemotDataSource.makeReview(
        message,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Notifications>>> getHistoryOfNotifications() async{
     try {
      final result = await baseSettingsNotificationsRemotDataSource.getHistoryNotifications();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }
}
