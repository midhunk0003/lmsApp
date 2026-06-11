import 'package:flutter/material.dart';
import 'package:lms/core/failure.dart';
import 'package:lms/core/success.dart';
import 'package:lms/data/local_data_source/local_data_sourse.dart';
import 'package:lms/data/model/login_model/login_model.dart';
import 'package:lms/domain/repository/auth_repository.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final AuthLocalDataSource localDataSource;

  AuthProvider({required this.authRepository, required this.localDataSource});

  AuthStatus _status = AuthStatus.initial;
  bool _isObscureText = true;
  Success? _success;
  Failure? _failure;
  LoginModel? _loginMOdel;

  AuthStatus get status => _status;
  bool get isObscureText => _isObscureText;
  Success? get success => _success;
  Failure? get failure => _failure;
  LoginModel? get loginModel => _loginMOdel;

  void showHidePassword() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }

  Future<void> loginProvider(String? userName, String? password) async {
    _status = AuthStatus.loading;
    _success = null;
    _loginMOdel = null;
    _failure = null;
    notifyListeners();
    final result = await authRepository.Login(userName, password);
    result.fold(
      (failure) {
        _failure = failure;
        print("failure: ${failure.message}");
        _status = AuthStatus.failure;
      },
      (success) async {
        _loginMOdel = success;
        _status = AuthStatus.success;
      },
    );
    notifyListeners();
  }

  Future<void> registerProvider(
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  ) async {
    _status = AuthStatus.loading;
    _success = null;
    _loginMOdel = null;
    _failure = null;
    notifyListeners();
    final result = await authRepository.Register(
      name,
      email,
      password,
      confirmPassword,
    );
    result.fold(
      (failure) {
        _failure = failure;
        print("failure: ${failure.message}");
        _status = AuthStatus.failure;
      },
      (success) async {
        _loginMOdel = success;
        _status = AuthStatus.success;
      },
    );
    notifyListeners();
  }

  // clear failure
  void clearFailure() {
    _status = AuthStatus.initial;
    _failure = null;
    _loginMOdel = null;
    notifyListeners();
  }

  Future<bool> logoutProvider() async {
    try {
      _status = AuthStatus.loading;
      notifyListeners();
      await localDataSource.clearSession();
      _status = AuthStatus.initial;
      notifyListeners();
      print("User logged out successfully");
      return true;
    } catch (e) {
      _status = AuthStatus.failure;
      print("Logout failed: $e");
      notifyListeners();
      return false;
    }
  }
}
