import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../../data_layer/model/development_flow_parameters.dart';
import '../base_repository/development_flow_repository.dart';

class UpdateTipsUseCase
    implements BaseUseCase<Either<Failure, General>, List > {
  final BaseDevelopmentFlowRepository baseTipsRepository;

  UpdateTipsUseCase(this.baseTipsRepository);

  @override
  Future<Either<Failure, General>> call(
      List parameters) async {
    return await baseTipsRepository.updateTips(parameters);
  }
}