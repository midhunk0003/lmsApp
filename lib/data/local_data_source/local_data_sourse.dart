import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lms/data/model/login_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences prefs;

  AuthLocalDataSource({required this.secureStorage, required this.prefs});

  // save data to local storage L0gin response data
  Future<void> saveUserData(LoginModel model) async {
    final data = model.data;
    final user = data?.user;

    /// ================= TOKEN =================
    await secureStorage.write(
      key: 'access_token',
      value: data?.accessToken ?? '',
    );

    /// ================= USER INFO =================
    await prefs.setString('user_id', user?.id ?? '');

    await prefs.setString('name', user?.name ?? '');

    await prefs.setString('email', user?.email ?? '');

    await prefs.setString('avatar', user?.avatar ?? '');

    await prefs.setString('created_at', user?.createdAt.toString() ?? '');

    await prefs.setString('updated_at', user?.updatedAt.toString() ?? '');
  }

  Future<void> clearSession() async {
    await secureStorage.deleteAll();
    // await prefs.clear();
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'access_token');
  }
}
