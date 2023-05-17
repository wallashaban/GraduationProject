import 'package:dartz/dartz.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/entities/disease.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/repository/disease_base_repository.dart';
import 'package:graduation_project/core/utils/exports.dart';

class GetAiDiseaseUseCase implements BaseUseCase<Either<Failure,List<AiDisease>>, NoParameters> {
  final DiseaseBaseRepository diseaseBaseRepository;

  GetAiDiseaseUseCase(this.diseaseBaseRepository);
  
  @override
  Future<Either<Failure,List<AiDisease>>> call(NoParameters parameters)async {
   return await diseaseBaseRepository.getAllAiDiseases();
  }
}
