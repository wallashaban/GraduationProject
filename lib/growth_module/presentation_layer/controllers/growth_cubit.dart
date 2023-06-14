import 'package:graduation_project/core/caching_data/growth_cach.dart';
import 'package:graduation_project/growth_module/domain_layer/entities/growth.dart';
import 'package:graduation_project/growth_module/domain_layer/usecases/get_all_growth_use_case.dart';

import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/range_growth.dart';
import '../../domain_layer/usecases/calculate_growth_use_case.dart';
import '../../domain_layer/usecases/edit_growth_use_case.dart';
import '../../domain_layer/usecases/get_range_growth_of_chld_use_case.dart';

part 'growth_state.dart';

class GrowthCubit extends Cubit<GrowthState> {
  CalculateGrowthUseCase calculateGrowthUseCase;
  GetAllGrowthOfChildUseCase getAllGrowthOfChildUseCase;
  GetRangeGrowthOfChildUseCase getRangeGrowthOfChildUseCase;
  EditGrowthUseCase editGrowthUseCase;
  GrowthCubit(
    this.calculateGrowthUseCase,
    this.getAllGrowthOfChildUseCase,
    this.getRangeGrowthOfChildUseCase,
    this.editGrowthUseCase,
  ) : super(GrowthInitial());
  Growth? growth;
  List<Growth> allGrowth = [];
  RangeGrowth? rangeGrowth;

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
        Hive.box('growthCach').put(
          'growth ${r.id} ${CashHelper.getData(key: 'id')}',
          GrowrhCach(
            id: r.id,
            height: r.height,
            weight: r.weight,
            heightStatus: r.heightStatus,
            weightStatus: r.weightStatus,
            measureDate: r.measureDate,
          ),
        );
        emit(ClaculateGrowthSuccessSatate());
        // getAllGrowth();
      },
    );
  }

  Future editeGrowth(GrowthParameters parameters) async {
    emit(EditGrowthLoadingSatate());
    final result = await editGrowthUseCase(parameters);

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error disease $l');
        emit(
          EditGrowthErrorSatate(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        growth = r;
        Hive.box('growthCach').put(
          'growth ${r.id} ${CashHelper.getData(key: 'id')}',
          GrowrhCach(
            id: r.id,
            height: r.height,
            weight: r.weight,
            heightStatus: r.heightStatus,
            weightStatus: r.weightStatus,
            measureDate: r.measureDate,
          ),
        );
        emit(EditGrowthSuccessSatate());
        //getAllGrowth();
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

  Future getRangeGrowth() async {
    emit(GetRangeGrowthLoadingSatate());
    final result = await getRangeGrowthOfChildUseCase(const NoParameters());

    result.fold(
      (l) {
        serverFailure = l;
        debugPrint('error disease $l');
        emit(
          GetRangeGrowthErrorSatate(
            error: l.message.toString(),
          ),
        );
      },
      (r) {
        rangeGrowth = r;
        emit(GetRangeGrowthSuccessSatate());
      },
    );
  }
}
