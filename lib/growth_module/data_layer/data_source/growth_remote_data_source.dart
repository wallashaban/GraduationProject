import '../../../core/use_case/base_use_case.dart';
import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/growth.dart';
import '../models/growth_model.dart';

abstract class BaseGrowthRemoteDataSource {
  Future<Growth> calculateGrowth(GrowthParameters parameters);
  Future<List<GrowthModel>> getAllGrowthofChild();
}

class GrowthRemoteDataSource implements BaseGrowthRemoteDataSource {
  Dio? dio;

  GrowthRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${CashHelper.getData(key: 'token')}',
        });
    dio = Dio(options);
  }

  @override
  Future<GrowthModel> calculateGrowth(GrowthParameters parameters) async {
    FormData data = FormData.fromMap({
      'weight': parameters.weight,
      'height': parameters.height,
      "measure_date": parameters.measureDate
    });
    final Response response = await dio!.post(
      AppConstants.calculateGrowth,
      data: data,
    );

    if (response.data['status'] == true) {
      debugPrint('store growth  remote data ${response.data}');
      return GrowthModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<GrowthModel>> getAllGrowthofChild() async {
    final Response response = await dio!.get(
      AppConstants.getAllGrowth,
    );

    if (response.data['status'] == true) {
      debugPrint('store medical test  remote data ${response.data}');
      return List<GrowthModel>.from((response.data['data'] as List)
          .map((growth) => GrowthModel.fromJson(growth))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
