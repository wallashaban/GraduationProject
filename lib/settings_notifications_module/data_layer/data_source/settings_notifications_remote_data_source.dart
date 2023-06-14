
import 'package:graduation_project/core/utils/dio_helper.dart';

import '../../../core/utils/exports.dart';
import '../models/notifiactions_model.dart';

abstract class BaseSettingsNotificationsRemotDataSource {
  // Future<UserUpdateModel> updateUserInfo(RegisterUserParameters parameters);
   Future<GeneralModel> logOut();
        Future<GeneralModel> makeReview(String message);
        Future<List<NotificationsModel>> getHistoryNotifications();

}

class SettingsNotificationsRemoteDataSource implements BaseSettingsNotificationsRemotDataSource{
   Dio? dio;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2JhYnktaGVhbHRoLWNhcmUuc29uaWNhci50ZWNoL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwODIxMzgxLCJuYmYiOjE2ODA4MjEzODEsImp0aSI6ImxJbFNuU1NEQ1lGOERlekQiLCJzdWIiOiIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.8FI98FIdeduQZmJEVlk7sW5BfcEB4Kxjq6zK9YhrXlk';

  SettingsNotificationsRemoteDataSource() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${CashHelper.getData(key: 'token')}',
        });
    dio = Dio(options);
  }
  
  /* @override
  Future<UserUpdateModel> updateUserInfo(RegisterUserParameters parameters)async {
        FormData data = FormData.fromMap({
                 'name': parameters.name,
      'email': parameters.email,
      'password': parameters.password,
      'password confirmation': parameters.passwordConfirm,
      'gender': parameters.gender,
      'birth_date': parameters.birthDate,
      'photo':parameters.photo==null?null:   await MultipartFile.fromFile(parameters.photo!, ),
      'phone_number':parameters.phone,
    });
    final Response response =
        await DioHelper.postData(url: AppConstants.updateProfile,
        data: data ,
        token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('update info  remote data ${response.data}');
      return UserUpdateModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
   */
  @override
  Future<GeneralModel> logOut() async {
        
    final Response response =
        await DioHelper.postData(url: AppConstants.logOut,token: CashHelper.getData(key: 'token'),);
    if (response.data['status'] == true) {
      debugPrint('logout  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  
  @override
  Future<GeneralModel> makeReview(String message)async {
        FormData data = FormData.fromMap({
                 'message': message,
      
    });
    final Response response =
        await DioHelper.postData(url: AppConstants.review,data: data,token: CashHelper.getData(key: 'token'),);
    if (response.data['status'] == true) {
      debugPrint('review  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  
  @override
  Future<List<NotificationsModel>> getHistoryNotifications() async {
        
    final Response response =
        await DioHelper.getData(url: AppConstants.notification,bearerToken: CashHelper.getData(key: 'token'),);
    if (response.data['status'] == true) {
      debugPrint('notification  remote data ${response.data}');
       return List<NotificationsModel>.from((response.data['data'] as List)
          .map((notification) => NotificationsModel.fromJson(notification))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  
}