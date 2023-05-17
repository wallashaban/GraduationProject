import 'package:dartz/dartz.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/repository/disease_base_repository.dart';
import 'package:graduation_project/core/utils/exports.dart';

class StoreAiDiseaseUseCase implements BaseUseCase<Either<Failure,General>, DiseaseParameters> {
  final DiseaseBaseRepository diseaseBaseRepository;

  StoreAiDiseaseUseCase(this.diseaseBaseRepository);
  
  @override
  Future<Either<Failure,General>> call(DiseaseParameters parameters)async {
   return await diseaseBaseRepository.storeAiDisease(parameters);
  }
}
