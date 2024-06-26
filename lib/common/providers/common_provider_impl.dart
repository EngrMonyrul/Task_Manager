part of 'common_provider.dart';

class CommonProviderImpl extends CommonProvider {
  @override
  void setLoading() {
    _loading = !_loading;
    notifyListeners();
  }
}
