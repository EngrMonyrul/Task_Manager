import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get topBarSize => MediaQuery.of(this).padding.top;

  ThemeData get theme => Theme.of(this);
}
