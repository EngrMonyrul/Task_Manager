part of 'shared_pref.dart';

class SharedPrefImpl extends SharedPref {
  SharedPrefImpl() {
    initSharedPref();
  }

  void initSharedPref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences _preferences;

  final _token = "_token_";

  @override
  Future<void> setToken({required String value}) async {
    await _preferences.setString(_token, value);
  }

  @override
  String get token => _preferences.getString(_token) ?? "";
}
