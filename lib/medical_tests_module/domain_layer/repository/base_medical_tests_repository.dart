import 'package:dartz/dartz.dart';


import '../../../core/utils/exports.dart';


abstract class BaseMedicalTestsRepository{
   /// medical tests
  Future<Either<Failure, MediaclTest>> storeMedicalTest(MediaclTestParameters file);
  Future<Either<Failure, List<MediaclTest>>> getAllMedicalTest();
  Future<Either<Failure, MediaclTest>> getSingleMedicalTest(int id);
  Future<Either<Failure, MediaclTest>> updateMedicalTest(
      MediaclTestParameters parameters);
  Future<Either<Failure, General>> deleteMedicalTest(int id);
}