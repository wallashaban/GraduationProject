import 'package:dartz/dartz.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/all_tips.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/get_question.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../entity/subject_questions.dart';

abstract class BaseDevelopmentFlowRepository {
  Future<Either<Failure, List<AllTips>>> allTips();
  Future<Either<Failure, List<QuestionsOfTip>>> questionsOfTips(int id);
  Future<Either<Failure, List<SubjectWithQuestion>>> subjectsWithQuestions();
  Future<Either<Failure, General>> createTips(List parameters);
  Future<Either<Failure, General>> updateTips(UpdateTipsParameters parameters);

}