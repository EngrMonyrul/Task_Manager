import 'package:flutter/material.dart';
import 'package:task_manager/utils/constants/sizes_const.dart';
import 'package:task_manager/utils/extensions/context_ext.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.borderRadius,
      this.onPressed,
      this.child});

  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius? borderRadius;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Container(
      alignment: Alignment.center,
      height: height ?? screenSize.height * .06,
      width: width ?? screenSize.width,
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.primary,
        borderRadius:
            borderRadius ?? BorderRadius.circular(SizesConsts.defaultRadius),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius:
              borderRadius ?? BorderRadius.circular(SizesConsts.defaultRadius),
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
