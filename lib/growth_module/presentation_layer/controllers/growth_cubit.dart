import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';
import 'package:graduation_project/growth_module/domain_layer/usecases/get_all_growth_use_case.dart';

import '../../../core/utils/exports.dart';
import '../../domain_layer/usecases/calculate_growth_use_case.dart';

part 'growth_state.dart';

class GrowthCubit extends Cubit<GrowthState> {
  CalculateGrowthUseCase calculateGrowthUseCase;
  GetAllGrowthOfChildUseCase getAllGrowthOfChildUseCase;
  GrowthCubit(
    this.calculateGrowthUseCase,
    this.getAllGrowthOfChildUseCase,
  ) : super(GrowthInitial());
  Growth? growth;
  List<Growth> allGrowth = [];
  Failure serverFailure = const ServerFailure(message: 'message');
  Future calculateGrowth(GrowthParameters parameters) async {
    emit(ClaculateGrowthLoadingSatate());
    final result = await calculateGrowthUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error disease $l');
        emit(
          ClaculateGrowthErrorSatate(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        growth = r;
        emit(ClaculateGrowthSuccessSatate());
        getAllGrowth();
      },
    );
  }


  Future getAllGrowth() async {
    emit(GetAllGrowthLoadingSatate());
    final result = await getAllGrowthOfChildUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error disease $l');
        emit(
          GetAllGrowthErrorSatate(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        allGrowth = r;
        emit(GetAllGrowthSuccessSatate());
      },
    );
  }
}
