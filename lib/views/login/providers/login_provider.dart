import 'package:flutter/cupertino.dart';
import 'package:task_manager/models/base_response.dart';
import 'package:task_manager/models/login/login.dart';
import 'package:task_manager/models/login/login_response.dart';
import 'package:task_manager/repository/login/login_repo.dart';

part 'login_provider_impl.dart';

abstract class LoginProvider extends ChangeNotifier {
  bool _showPassword = true;
  bool _rememberMe = false;
  Login? _login;
  LoginResponse? _loginResponse;

  bool get showPassword => _showPassword;

  bool get rememberMe => _rememberMe;

  Login? get login => _login;

  LoginResponse? get loginResponse => _loginResponse;

  void setShowPassword();

  void setRememberMe({required bool remember});

  void setLogin({String? password, String? email});

  Future<BaseResponse<LoginResponse>> loginIn();
}
