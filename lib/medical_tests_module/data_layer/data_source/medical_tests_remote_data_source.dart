import 'package:graduation_project/core/utils/dio_helper.dart';

import '../../../core/utils/exports.dart';
import '../models/medical_test_model.dart';

abstract class BaseMedicalTestsRemoteDataSource {
  /// medical tests
  Future<MediaclTestModel> storeMedicalTest(MediaclTestParameters file);
  Future<List<MediaclTestModel>> getAllMedicalTest();
  Future<MediaclTestModel> getSingleMedicalTest(int id);
  Future<MediaclTestModel> updateMedicalTest(MediaclTestParameters parameters);
  Future<GeneralModel> deleteMedicalTest(int id);
}

class MedicalTestsRemoteDataSource implements BaseMedicalTestsRemoteDataSource {
  Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwODIxMzgxLCJuYmYiOjE2ODA4MjEzODEsImp0aSI6ImxJbFNuU1NEQ1lGOERlekQiLCJzdWIiOiIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8FI98FIdeduQZmJEVlk7sW5BfcEB4Kxjq6zK9YhrXlk';

  MedicalTestsRemoteDataSource() {
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
  Future<GeneralModel> deleteMedicalTest(int id) async {
    final Response response = await DioHelper.deleteData(
      url: '${AppConstants.deleteMedicalTrest} $id',
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('delete test remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MediaclTestModel>> getAllMedicalTest() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.getallMedicalTrest,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('medical tests  remote data ${response.data}');
      return List<MediaclTestModel>.from((response.data['data'] as List)
          .map((test) => MediaclTestModel.fromJson(test))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MediaclTestModel> getSingleMedicalTest(int id) async {
    final Response response = await DioHelper.getData(
      url: '${AppConstants.getSingleMedicalTest}$id',
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('single medical test  remote data ${response.data}');
      return MediaclTestModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MediaclTestModel> storeMedicalTest(
      MediaclTestParameters parameters) async {
    FormData data = FormData.fromMap({
      'lab_name': parameters.labName,
      'type': parameters.type,
      'date': parameters.labDate,
      "file": parameters.labFile == null
          ? null
          : await MultipartFile.fromFile(
              parameters.labFile!,
            ),
    });
    final Response response = await DioHelper.postData(
      url: AppConstants.storeMedicalTest,
      token: CashHelper.getData(key: 'token'),
      data: data,
    );

    if (response.data['status'] == true) {
      debugPrint('store medical test  remote data ${response.data}');
      return MediaclTestModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MediaclTestModel> updateMedicalTest(
      MediaclTestParameters parameters) async {
    FormData data = FormData.fromMap({
      'lab_name': parameters.labName,
      'type': parameters.type,
      'date': parameters.labDate,
      if (parameters.labFile != null)
        "file": await MultipartFile.fromFile(
          parameters.labFile!,
        ),
    });
    final Response response = await DioHelper.postData(
      url: '${AppConstants.updateMedicalTrest}${parameters.id}',
      data: data,
      token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('store medical details  remote data ${response.data}');
      return MediaclTestModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
