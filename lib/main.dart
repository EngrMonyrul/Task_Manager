import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/utils/initPackages/init_providers.dart';
import 'package:task_manager/utils/theme/theme_config.dart';
import 'package:task_manager/views/login/providers/login_provider.dart';
import 'package:task_manager/views/login/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...initProviders(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.lightThemeConfig,
        home: const LoginScreen(),
      ),
    );
  }
}
