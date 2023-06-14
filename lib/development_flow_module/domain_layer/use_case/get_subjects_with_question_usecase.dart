import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../base_repository/development_flow_repository.dart';
import '../entity/subject_questions.dart';

class SubjectsWithQuestionsUseCase
    implements BaseUseCase<Either<Failure, List<SubjectWithQuestion>>, NoParameters> {
  final BaseDevelopmentFlowRepository baseTipsRepository;

  SubjectsWithQuestionsUseCase(this.baseTipsRepository);

  @override
  Future<Either<Failure,List<SubjectWithQuestion>>> call(
      NoParameters parameters) async {
    return await baseTipsRepository.subjectsWithQuestions();
  }
}