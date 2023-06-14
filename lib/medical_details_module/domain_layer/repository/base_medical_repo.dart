
import 'package:dartz/dartz.dart';
import '../../../core/utils/exports.dart';
import '../entites/medical_details.dart';

abstract class BaseMedicalDetailsRepository {
  //medical details
  Future<Either<Failure, MedicalDetails>> storeMedicalDetails(
      StoreMedicalDetailsParameters parameters);
  Future<Either<Failure, MedicalDetails>> updateMedicalDetails(
      StoreMedicalDetailsParameters parameters);   
      Future<Either<Failure, MedicalDetails>> showMedicalDetails();    
  
     
  
    }
