part of "login_provider.dart";

class LoginProviderImpl extends LoginProvider {
  @override
  void setShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  @override
  void setRememberMe({required bool remember}) {
    _rememberMe = remember;
    notifyListeners();
  }

  @override
  void setLogin({required String password, required String email}) {
    _login ??= Login();
    _login = _login!.copyWith(
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
