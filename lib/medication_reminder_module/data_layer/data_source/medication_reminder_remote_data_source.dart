import '../../../core/utils/dio_helper.dart';
import '../../../core/utils/exports.dart';

abstract class BaseMedicationReminderRemoteDataSource {
  Future<List<Days>> getAllDays();
  Future<List<Reminder>> getAllMedicationReminder();
  Future<Reminder> getSingleMedicationReminder(int id);
  Future<GeneralModel> storeRemnider(ReminderParameters parameters);
  Future<GeneralModel> updateReminder(ReminderParameters parameters);
  Future<GeneralModel> deleteReminder(int id);
}

class MedicationReminderRemoteDataSource
    implements BaseMedicationReminderRemoteDataSource {
  Dio? dio;

  MedicationReminderRemoteDataSource() {
    debugPrint('token reminder ${token}');
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
  Future<GeneralModel> deleteReminder(int id) async {
    final Response response = await DioHelper.deleteData(
     url: '${AppConstants.deleteReminder} $id',
     token: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('delete reminder remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Days>> getAllDays() async {
    final Response response = await DioHelper.getData(
     url: AppConstants.getAllDays,
     bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('days  remote data ${response.data}');
      return List<DaysModel>.from((response.data['data'] as List)
          .map((days) => DaysModel.fromJson(days))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Reminder>> getAllMedicationReminder() async {
    final Response response = await DioHelper.getData(
      url: AppConstants.getAllReminders,
      bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('all reminders  remote data ${response.data}');
      return List<ReminderModel>.from((response.data['data'] as List)
          .map((reminder) => ReminderModel.fromJson(reminder))
          .toList());
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Reminder> getSingleMedicationReminder(int id) async {
    final Response response = await DioHelper.getData(
     url: '${AppConstants.getSingleReminder}$id',
     bearerToken: CashHelper.getData(key: 'token'),
    );
    if (response.data['status'] == true) {
      debugPrint('single reminder   remote data ${response.data}');
      return ReminderModel.fromJson(response.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GeneralModel> storeRemnider(ReminderParameters parameters) async {
    Map<dynamic, dynamic> data = {
      'medicine_name': parameters.medicineName,
      'appointment': parameters.appointment,
      'end_date': parameters.endDate,
      'mediceTimes': parameters.times,
    };
    final Response response =
        await DioHelper.postData(url: AppConstants.storeReminder, data: data,
        token: CashHelper.getData(key: 'token'),);
    if (response.data['status'] == true) {
      debugPrint('store reminder details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GeneralModel> updateReminder(ReminderParameters parameters) async {
    final Response response = await DioHelper.putData(
        url:'${AppConstants.updateReminder}${parameters.id}',
        query: {
          'medicine_name': parameters.medicineName,
          'appointment': parameters.appointment,
          'end_date': parameters.endDate,
          'mediceTimes': parameters.times,
        },
        token: CashHelper.getData(key: 'token'),
        );
    if (response.data['status'] == true) {
      debugPrint('update reminder details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
