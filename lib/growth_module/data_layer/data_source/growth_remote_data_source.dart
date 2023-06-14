import 'package:graduation_project/core/utils/dio_helper.dart';
import 'package:graduation_project/growth_module/data_layer/models/range_growth_model.dart';

import '../../../core/utils/exports.dart';
import '../models/growth_model.dart';

abstract class BaseGrowthRemoteDataSource {
  Future<GrowthModel> calculateGrowth(GrowthParameters parameters);
  Future<List<GrowthModel>> getAllGrowthofChild();
  Future<GrowthModel> editGrowth(GrowthParameters parameters);
  Future<RangeGrowthModel> getRangeGrowthOfChild();
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
    final Response response = await DioHelper.postData(
     url: AppConstants.calculateGrowth,
      data: data,
      token: CashHelper.getData(key: 'token'),
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
    final Response response = await DioHelper.getData(
     url: AppConstants.getAllGrowth,
     bearerToken: CashHelper.getData(key: 'token'),
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
  
  @override
  Future<GrowthModel> editGrowth(GrowthParameters parameters) async {
    FormData data = FormData.fromMap({
      'weight': parameters.weight,
      'height': parameters.height,
      "measure_date": parameters.measureDate
    });
    final Response response = await DioHelper.postData(
     url: '${AppConstants.editGrowth}${parameters.id}',
      data: data,
      token: CashHelper.getData(key: 'token'),
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
  Future<RangeGrowthModel> getRangeGrowthOfChild() async {
    
    final Response response = await DioHelper.getData(
     url: AppConstants.rangeGrowth,
      bearerToken: CashHelper.getData(key: 'token'),
    );

    if (response.data['status'] == true) {
      debugPrint('store growth  remote data ${response.data}');
      return RangeGrowthModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
