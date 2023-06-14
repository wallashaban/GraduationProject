import 'package:graduation_project/core/utils/dio_helper.dart';

import '../../../core/utils/exports.dart';
import '../models/medical_teeth_model.dart';
import '../models/teeth_model.dart';

abstract class BaseTeethDevelopmentRemoteDataSource {
  // teeth development
  Future<TeethModel> storeTeethDevelopment(TeethParameters parameters);
  Future<TeethModel> updateTeethDevelopment(TeethParameters parameters);
  Future<GeneralModel> deleteTeethDevelpoment(int id);
  Future<TeethModel> getSingleTeeth(int id);
  Future<List<TeethModel>> getAllTeethDevelpoment();
  Future<List<MedicalTeethModel>> getMedicalTeeth();
}

class TeethDevelopmentRemoteDataSource
    implements BaseTeethDevelopmentRemoteDataSource {
  Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwODIxMzgxLCJuYmYiOjE2ODA4MjEzODEsImp0aSI6ImxJbFNuU1NEQ1lGOERlekQiLCJzdWIiOiIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8FI98FIdeduQZmJEVlk7sW5BfcEB4Kxjq6zK9YhrXlk';

  TeethDevelopmentRemoteDataSource() {
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
  Future<GeneralModel> deleteTeethDevelpoment(int id) async {
    final Response response = await DioHelper.deleteData(
      url: '${AppConstants.deleteTeethDev} $id',
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('delete teeth remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TeethModel>> getAllTeethDevelpoment() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.getAllTeethDev,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('teeth  remote data ${response.data}');
      return List<TeethModel>.from((response.data['data'] as List)
          .map((teeth) => TeethModel.fromJson(teeth))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MedicalTeethModel>> getMedicalTeeth() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.getMedicalTeeth,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('teeth  remote data ${response.data}');
      return List<MedicalTeethModel>.from((response.data['data'] as List)
          .map((teeth) => MedicalTeethModel.fromJson(teeth))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TeethModel> getSingleTeeth(int id) async {
    final Response response = await DioHelper.getData(
      url: '${AppConstants.getSingleTeeth}$id',
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('single teeth test  remote data ${response.data['data']}');
      return TeethModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TeethModel> storeTeethDevelopment(TeethParameters parameters) async {
    final Response response = await DioHelper.postData(
      url: AppConstants.storeTeethDev,
      query: {
        'apperance_date': parameters.apperenceDate,
        'teeth_id': parameters.toothId,
      },
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('store teeth details  remote data ${response.data}');
      return TeethModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TeethModel> updateTeethDevelopment(
      TeethParameters parameters) async {
    final Response response = await DioHelper.postData(
      url: '${AppConstants.updateTeethDev}${parameters.id}',
      query: {
        'apperance_date': parameters.apperenceDate,
        'teeth_id': parameters.toothId,
      },
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('update teeth details  remote data ${response.data}');
      return TeethModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
