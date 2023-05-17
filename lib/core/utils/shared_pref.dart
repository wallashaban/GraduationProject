import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveData({required String key, required dynamic value}) {
    if (value is bool) {
      sharedPreferences!.setBool(
        key,
        value,
      );
    } else if (value is String) {
      sharedPreferences!.setString(
        key,
        value,
      );
    } else if (value is int) {
      sharedPreferences!.setInt(
        key,
        value,
      );
    } else {
      sharedPreferences!.setDouble(
        key,
        value,
      );
    }
  }

  static getData({required key}) {
    return sharedPreferences!.get(
      key,
    );
  }

  static deleteData({required String key}) {
    sharedPreferences!.remove(key);
  }
}
