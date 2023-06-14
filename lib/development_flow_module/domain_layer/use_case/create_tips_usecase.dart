import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../../../medical_details_module/domain_layer/entites/general.dart';
import '../base_repository/development_flow_repository.dart';

class CreateTipsUseCase
    implements BaseUseCase<Either<Failure, General>, List> {
  final BaseDevelopmentFlowRepository baseTipsRepository;

  CreateTipsUseCase(this.baseTipsRepository);

  @override
  Future<Either<Failure, General>> call(List parameters) async {
    return await baseTipsRepository.createTips(parameters);
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
