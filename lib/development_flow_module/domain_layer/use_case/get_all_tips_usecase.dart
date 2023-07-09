import 'package:dartz/dartz.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/all_tips.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../base_repository/development_flow_repository.dart';

class AllTipsUseCase
    implements BaseUseCase<Either<Failure, List<AllTips>>, NoParameters> {
  final BaseDevelopmentFlowRepository baseTipsRepository;

  AllTipsUseCase(this.baseTipsRepository);

  @override
  Future<Either<Failure, List<AllTips>>> call(
      NoParameters parameters) async {
    return await baseTipsRepository.allTips();
  }
}