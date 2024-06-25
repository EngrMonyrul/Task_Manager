import 'package:flutter/cupertino.dart';

part 'login_provider_impl.dart';

abstract class LoginProvider extends ChangeNotifier {
  bool _showPassword = true;
  bool _rememberMe = false;

  bool get showPassword => _showPassword;

  bool get rememberMe => _rememberMe;

  void setShowPassword();

  void setRememberMe({required bool remember});
}
