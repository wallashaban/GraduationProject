
import 'package:dartz/dartz.dart';


import 'package:graduation_project/core/utils/exports.dart';


class MedicationRepository implements BaseMedicationReminderRepository {
  final BaseMedicationReminderRemoteDataSource
      baseMedicationReminderRemoteDataSource;

  MedicationRepository(this.baseMedicationReminderRemoteDataSource);

  @override
  Future<Either<Failure, General>> deleteReminder(int id)async {
    try {
      final result = await baseMedicationReminderRemoteDataSource.deleteReminder(
      id,
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
  Future<Either<Failure, List<Days>>> getAllDays()async {
    try {
      final result = await baseMedicationReminderRemoteDataSource.getAllDays(    );
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
  Future<Either<Failure, List<Reminder>>> getAllMedicationReminder()async {
    try {
      final result = await baseMedicationReminderRemoteDataSource.getAllMedicationReminder(
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
  Future<Either<Failure, Reminder>> getSingleMedicationReminder(int id)async {
    try {
      final result = await baseMedicationReminderRemoteDataSource.getSingleMedicationReminder(
      id,
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
  Future<Either<Failure, General>> storeRemnider(ReminderParameters parameters) async{
    try {
      final result = await baseMedicationReminderRemoteDataSource.storeRemnider(
      parameters,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }  }

  @override
  Future<Either<Failure, General>> updateReminder(ReminderParameters parameters)async {
    try {
      final result = await baseMedicationReminderRemoteDataSource.updateReminder(
      parameters,
    );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    } }

}
