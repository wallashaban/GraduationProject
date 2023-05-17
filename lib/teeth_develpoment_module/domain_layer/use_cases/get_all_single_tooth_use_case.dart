import 'package:dartz/dartz.dart';
import '../../../core/use_case/base_use_case.dart';
import '../repository/base_teeth_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/teeth.dart';

class GetSingleToothUseCase
    implements
        BaseUseCase<Either<Failure, Teeth>, int> {
  final BaseTeetDevelopmentRepository baseTeetDevelopmentRepository;

  GetSingleToothUseCase(this.baseTeetDevelopmentRepository);

  @override
  Future<Either<Failure, Teeth>> call(
      int id) async {
    return await baseTeetDevelopmentRepository.getSingleTeeth(id);
  }
}
