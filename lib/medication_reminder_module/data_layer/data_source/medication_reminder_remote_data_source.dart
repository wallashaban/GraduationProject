

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
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
          'token': '',
        });
    dio = Dio(options);
  }

  @override
  Future<GeneralModel> deleteReminder(int id) async {
    final Response response = await dio!.delete(
      '${AppConstants.deleteReminder} $id',
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
    final Response response = await dio!.get(
      AppConstants.getAllDays,
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
    final Response response = await dio!.get(
      AppConstants.getAllReminders,
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
    final Response response = await dio!.get(
      '${AppConstants.getSingleReminder}$id',
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

  List a = [];
  @override
  Future<GeneralModel> storeRemnider(ReminderParameters parameters) async {
    final Response response =
        await dio!.post(AppConstants.storeReminder, queryParameters: {
      'medicine_name': parameters.medicineName,
      'appointment': parameters.appointment,
      'end_date': parameters.endDate,
      'mediceTimes': parameters.times,
    });
    if (response.data['status'] == true) {
      debugPrint('store reminder details  remote data ${response.data}');
      return GeneralModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  void func() {}
  @override
  Future<GeneralModel> updateReminder(ReminderParameters parameters) async {
    final Response response = await dio!.put(
        '${AppConstants.updateReminder}${parameters.id}',
        queryParameters: {
          'medicine_name': parameters.medicineName,
          'appointment': parameters.appointment,
          'end_date': parameters.endDate,
          'mediceTimes': parameters.times.map((e) {
            'quantity';
            e.quantity;
          }),
        });
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
