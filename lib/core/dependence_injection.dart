import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:lms/data/local_data_source/local_data_sourse.dart';
import 'package:lms/data/repository_implimentation/auth_repo_implimentation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:lms/data/network/api_client.dart';

import 'package:lms/domain/repository/auth_repository.dart';

import 'package:lms/presentation/provider/auth_provider.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  /// ================= HTTP CLIENT =================
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  /// ================= SHARED PREFS =================
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  /// ================= SECURE STORAGE =================
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  /// ================= API CLIENT =================
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<http.Client>()));

  /// ================= LOCAL DATASOURCE =================
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(
      secureStorage: getIt<FlutterSecureStorage>(),
      prefs: getIt<SharedPreferences>(),
    ),
  );

  /// ================= REPOSITORY =================

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplimentation(
      apiClient: getIt<ApiClient>(),
      localDataSource: getIt<AuthLocalDataSource>(),
    ),
  );

  /// ================= PROVIDER =================
  getIt.registerFactory<AuthProvider>(
    () => AuthProvider(
      authRepository: getIt<AuthRepository>(),
      localDataSource: getIt<AuthLocalDataSource>(),
    ),
  );
}
