import 'package:dartz/dartz.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/get_question.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../base_repository/development_flow_repository.dart';

class QuestionsOfTipUseCase
    implements BaseUseCase<Either<Failure, List<QuestionsOfTip>>, int> {
  final BaseDevelopmentFlowRepository baseDevelopmentFlowRepository;

  QuestionsOfTipUseCase(this.baseDevelopmentFlowRepository);

  @override
  Future<Either<Failure,List<QuestionsOfTip>>> call(
      int id) async {
    return await baseDevelopmentFlowRepository.questionsOfTips(id);
  }
}