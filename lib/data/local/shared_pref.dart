import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_impl.dart';

abstract class SharedPref {
  String get token;

  Future<void> setToken({required String value});
}
