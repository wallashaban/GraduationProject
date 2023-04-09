
import '../../../core/utils/exports.dart';
import '../models/teeth_model.dart';

abstract class BaseTeethDevelopmentRemoteDataSource{
   // teeth development
  Future<GeneralModel> storeTeethDevelopment(TeethParameters parameters);
  Future<GeneralModel> updateTeethDevelopment(TeethParameters parameters);
  Future<GeneralModel> deleteTeethDevelpoment(int id);
  Future<TeethModel> getSingleTeeth(int id);
  Future<List<TeethModel>> getAllTeethDevelpoment();
}

class TeethDevelopmentRemoteDataSource implements BaseTeethDevelopmentRemoteDataSource{
   Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwODIxMzgxLCJuYmYiOjE2ODA4MjEzODEsImp0aSI6ImxJbFNuU1NEQ1lGOERlekQiLCJzdWIiOiIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8FI98FIdeduQZmJEVlk7sW5BfcEB4Kxjq6zK9YhrXlk';

  TeethDevelopmentRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    dio = Dio(options);
  }



   @override
  Future<GeneralModel> deleteTeethDevelpoment(int id) async {
    final Response response = await dio!.delete(
      '${AppConstants.deleteTeethDev} $id',
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
    final Response response = await dio!.get(
      AppConstants.getAllTeethDev,
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
  Future<TeethModel> getSingleTeeth(int id) async {
    final Response response = await dio!.get(
      '${AppConstants.getSingleTeeth}$id',
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
  Future<GeneralModel> storeTeethDevelopment(TeethParameters parameters) async {
    final Response response =
        await dio!.post(AppConstants.storeTeethDev, queryParameters: {
      'apperance_date': parameters.apperenceDate,
      'teeth_name': parameters.teethName,
    });
    if (response.data['status'] == true) {
      debugPrint('store teeth details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


  @override
  Future<GeneralModel> updateTeethDevelopment(
      TeethParameters parameters) async {
    final Response response = await dio!.post(
        '${AppConstants.updateTeethDev}${parameters.id}',
        queryParameters: {
          'apperance_date': parameters.apperenceDate,
          'teeth_name': parameters.teethName,
        });
    if (response.data['status'] == true) {
      debugPrint('update teeth details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}