import 'package:dartz/dartz.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/entities/disease.dart';
import 'package:graduation_project/core/utils/exports.dart';


abstract class DiseaseBaseRepository {
  Future<Either<Failure, AiDiseasee>> storeAiDisease(DiseaseParameters parameters);
  Future<Either<Failure, General>> deleteAiDisease(int id);
  Future<Either<Failure, List<AiDiseasee>>> getAllAiDiseases();
   Future<String> predictDisease(
    PredictDiseaseParameters parameters
  );

}
