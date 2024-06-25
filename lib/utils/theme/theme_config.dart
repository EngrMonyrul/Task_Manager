import 'package:flutter/material.dart';
import 'package:task_manager/utils/theme/color_scheme_config.dart';

class ThemeConfig {
  ThemeConfig._();

  static final lightThemeConfig = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: "Poppins",
    colorScheme: ColorSchemeConfig.lightThemeColorScheme,
  );
}
