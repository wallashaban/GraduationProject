// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

abstract class BaseUseCase<T, Parameters> {
  Future<T> call(Parameters parameters);
}

class NoParameters {
  const NoParameters();
}

class LoginUserParameters {
  String email;
  String password;
  String fcmToken;
  LoginUserParameters({
    required this.email,
    required this.password,
    required this.fcmToken,
  });
}

class RegisterUserParameters {
  String name;
  String email;
  String password;
  String passwordConfirm;
  String gender;
  String birthDate;
  String fcmToken;
  RegisterUserParameters({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.gender,
    required this.birthDate,
    required this.fcmToken,
  });
}

class UpdatePasswordParameters {
  String code;
  String password;
  String passwordConfirm;
  UpdatePasswordParameters({
    required this.code,
    required this.password,
    required this.passwordConfirm,
  });
}

class LoginWithFacebookOrGoogleParameters {
  String oauthToken;
  String provider;
  String fcmToken;
  LoginWithFacebookOrGoogleParameters({
    required this.oauthToken,
    required this.provider,
    required this.fcmToken,
  });
}

class StoreMedicalDetailsParameters {
  int id;
  String bloodType;
  String allergy;
  String chronicDisease;
  String genticDisease;
  String skinDisease;
  bool isMedicine;
  var medicineFile;
  StoreMedicalDetailsParameters({
    required this.id,
    required this.bloodType,
    required this.allergy,
    required this.chronicDisease,
    required this.genticDisease,
    required this.skinDisease,
    required this.isMedicine,
    required this.medicineFile,
  });
}

class MediaclTestParameters {
  final int id;
  final String labName;
  final String type;
  final String labDate;

  final File labFile;
  const MediaclTestParameters({
    required this.id,
    required this.labName,
    required this.type,
    required this.labDate,
    required this.labFile,
  });
}

class PresccriptionParameters {
  int id;
  String note;
  String date;
  File file;
  PresccriptionParameters({
    required this.id,
    required this.note,
    required this.date,
    required this.file,
  });
}

class TeethParameters {
  int id;
  String teethName;
  String apperenceDate;
  TeethParameters({
    required this.id,
    required this.teethName,
    required this.apperenceDate,
  });
}

class ReminderParameters {
 final int id;
  final String medicineName;
  final String appointment;
  final String endDate;
  final List<MedicineTimes> times;
  const ReminderParameters({
    required this.id,
    required this.medicineName,
    required this.appointment,
    required this.endDate,
    required this.times,
  });
}

class MedicineTimes {
  final String quantity;
  final String time;
  final List days;
  final String month;
  const MedicineTimes({
    required this.quantity,
    required this.time,
    required this.days,
    required this.month,
  });
}
