import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/use_case/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/teeth.dart';
import '../repository/base_teeth_repository.dart';

class GetTeethUseCase
    implements
        BaseUseCase<Either<Failure, List<Teeth>>, NoParameters> {
  final BaseTeetDevelopmentRepository baseTeetDevelopmentRepository;

  GetTeethUseCase(this.baseTeetDevelopmentRepository);

  @override
  Future<Either<Failure, List<Teeth>>> call(
      NoParameters parameters) async {
    return await baseTeetDevelopmentRepository.getAllTeethDevelpoment();
  }
}
