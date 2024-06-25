import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_manager/utils/constants/assets_const.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.child,
    this.img,
    this.padding,
    this.color,
  });

  final Widget child;
  final String? img;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: AssetImage(img ?? AssetsConst.imgBg),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: child),
    );
  }
}
