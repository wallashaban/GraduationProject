import 'package:dartz/dartz.dart';
import 'package:graduation_project/ai_diseases_module/domain_layer/repository/disease_base_repository.dart';
import 'package:graduation_project/core/utils/exports.dart';

class DeleteAiDiseaseUseCase implements BaseUseCase<Either<Failure,General>, int> {
  final DiseaseBaseRepository diseaseBaseRepository;

  DeleteAiDiseaseUseCase(this.diseaseBaseRepository);
  
  @override
  Future<Either<Failure,General>> call(int id)async {
   return await diseaseBaseRepository.deleteAiDisease(id);
  }
}
