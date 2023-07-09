// ignore_for_file: prefer_typing_uninitialized_variables

abstract class BaseUseCase<T, Parameters> {
  Future<T> call(Parameters parameters);
}

class NoParameters {
  const NoParameters();
}

class PredictDiseaseParameters {
  String field;
  var photo;
  PredictDiseaseParameters({
    required this.field,
    required this.photo,
  });
}

class UpdateTipsParameters {
  List tips;
  int id;
  UpdateTipsParameters({
    required this.tips,
    required this.id,
  });
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
  String? password;
  String? passwordConfirm;
  String? gender;
  String birthDate;
  String? fcmToken;
  String? phone;
  String? photo;
  RegisterUserParameters({
    required this.name,
    required this.email,
    this.password,
    this.passwordConfirm,
    required this.gender,
    required this.birthDate,
    this.fcmToken,
    this.phone,
    this.photo,
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

class DiseaseParameters {
  int prediction;
  String? photo;
  String disease;
  DiseaseParameters({
    required this.prediction,
    required this.photo,
    required this.disease,
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
  int? id;
  String? bloodType;
  String? allergy;
  String? chronicDisease;
  String? genticDisease;
  String? skinDisease;
  String? isMedicine;
  StoreMedicalDetailsParameters({
    this.id,
    required this.bloodType,
    required this.allergy,
    required this.chronicDisease,
    required this.genticDisease,
    this.skinDisease,
    required this.isMedicine,
  });
}

class MediaclTestParameters {
  final int? id;
  final String labName;
  final String type;
  final String labDate;

  final String? labFile;
  const MediaclTestParameters({
    this.id,
    required this.labName,
    required this.type,
    required this.labDate,
    this.labFile,
  });
}

class PresccriptionParameters {
  int? id;
  String note;
  String date;
  String? file;
  PresccriptionParameters({
    this.id,
    required this.note,
    required this.date,
    this.file,
  });
}

class TeethParameters {
  int? id;
  int? toothId;
  String? teethName;
  String? apperenceDate;
  TeethParameters({
    this.id,
    required this.toothId,
    required this.teethName,
    required this.apperenceDate,
  });
}

class ReminderParameters {
  final int? id;
  final String? medicineName;
  final String? appointment;
  final String? endDate;
  final List times;
  const ReminderParameters({
    this.id,
    required this.medicineName,
    required this.appointment,
    required this.endDate,
    required this.times,
  });
}

class MedicineTimes {
  final String? time;
  final List<int>? days;
  final String? month;
  const MedicineTimes({
    required this.time,
    required this.days,
    required this.month,
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'days': days,
      'month': month,
    };
  }
}

class TipsParameters {
  int questionId;
  int status;
  TipsParameters({
    required this.questionId,
    required this.status,
  });
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['status'] = status;
    return data;
    /* return {
      'question_id': questionId,
      'status': status,
    }; */
  }
}

class GrowthParameters {
  int? id;
  double height;
  double weight;
  String measureDate;
  GrowthParameters({
    required this.height,
    required this.weight,
    required this.measureDate,
    this.id,
  });
}
