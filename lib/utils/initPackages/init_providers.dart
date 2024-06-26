import 'package:provider/provider.dart';
import 'package:task_manager/common/providers/common_provider.dart';
import 'package:task_manager/views/login/providers/login_provider.dart';

List<dynamic> initProviders() {
  return [
    ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProviderImpl()),
    ChangeNotifierProvider<CommonProvider>(
        create: (context) => CommonProviderImpl()),
  ];
}
