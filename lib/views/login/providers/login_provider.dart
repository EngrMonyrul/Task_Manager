import 'package:flutter/cupertino.dart';
import 'package:task_manager/models/login.dart';

part 'login_provider_impl.dart';

abstract class LoginProvider extends ChangeNotifier {
  bool _showPassword = true;
  bool _rememberMe = false;
  Login? _login;

  bool get showPassword => _showPassword;

  bool get rememberMe => _rememberMe;

  Login? get login => _login;

  void setShowPassword();

  void setRememberMe({required bool remember});

  void setLogin({required String password, required String email});
}
