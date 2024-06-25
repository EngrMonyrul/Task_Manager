part of "login_provider.dart";

class LoginProviderImpl extends LoginProvider {
  LoginRepo _loginRepo = LoginRepo();

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
  void setLogin({String? password, String? email}) {
    _login ??= Login();
    _login = _login!.copyWith(
      email: email,
      password: password,
    );
    notifyListeners();
  }

  @override
  Future<BaseResponse<LoginResponse>> loginIn() async {
    BaseResponse<LoginResponse>? result;
    if (_login != null) {
      result = await _loginRepo.loginSystem(login: _login!);
      _loginResponse = result.data;
    }
    return result ?? BaseResponse();
  }
}
