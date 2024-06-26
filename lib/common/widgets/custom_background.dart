import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_manager/utils/constants/assets_const.dart';

/// ### Custom Background
/// __to set scaffold background__
///
/// __Requested Parameters__
/// * [Widget] for [child]
/// * [String] for [img]
/// * [EdgeInsetsGeometry] for [padding]
/// * [Color] for [color]
///
/// __Return__
/// * [Container]
class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.child,
    this.img,
    this.padding,
    this.color,
  });

  //----------> variables <----------//
  final Widget child;
  final String? img;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      //----------> setting img for the background <----------//
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: AssetImage(img ?? AssetsConst.imgBg),
          fit: BoxFit.cover,
        ),
      ),
      //----------> child <----------//
      child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: child),
    );
  }
}
