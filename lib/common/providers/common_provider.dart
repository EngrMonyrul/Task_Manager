import 'package:flutter/foundation.dart';

part 'common_provider_impl.dart';

/// ### Common Provider
/// __this is common provider for common states__
///
/// __Parameters__
/// * [bool] for [loading]
abstract class CommonProvider extends ChangeNotifier {
  //----------> variables <----------//
  /// boolean loading variable
  bool _loading = false;

  //----------> getters <----------//
  /// boolean loading getter
  bool get loading => _loading;

  //----------> setters <----------//
  /// void loading setter
  void setLoading();
}
