
import 'package:graduation_project/ai_diseases_module/domain_layer/repository/disease_base_repository.dart';
import 'package:graduation_project/core/utils/exports.dart';

class PredictDiseaseUseCase implements BaseUseCase<String, PredictDiseaseParameters> {
  final DiseaseBaseRepository diseaseBaseRepository;

  PredictDiseaseUseCase(this.diseaseBaseRepository);

  @override
  Future<String> call(PredictDiseaseParameters parameters) async {
    return await diseaseBaseRepository.predictDisease(parameters);
  }
}


