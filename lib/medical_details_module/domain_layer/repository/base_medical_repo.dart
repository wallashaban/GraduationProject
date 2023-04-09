
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/utils/exports.dart';

abstract class BaseMedicalDetailsRepository {
  //medical details
  Future<Either<Failure, General>> storeMedicalDetails(
      StoreMedicalDetailsParameters parameters);
  Future<Either<Failure, List<Allergy>>> getAllAllergies();
  Future<Either<Failure, List<Disease>>> getAllSkinDieases();
  Future<Either<Failure, List<Disease>>> getAllChronicDieases();
  Future<Either<Failure, List<Disease>>> getAllGenticDiease(); 
    }
