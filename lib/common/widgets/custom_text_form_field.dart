import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/utils/constants/sizes_const.dart';
import 'package:task_manager/utils/extensions/context_ext.dart';

/// ### Custom Text Form Field
/// __custom text form field to handle input fields__
///
/// __Requested Parameters__
/// * [BorderRadius] for [enableBorderRadius]
/// * [BorderRadius] for [focusBorderRadius]
/// * [BorderRadius] for [errorBorderRadius]
/// * [BorderSide] for [enableBorderSide]
/// * [BorderSide] for [focusBorderSide]
/// * [BorderSide] for [errorBorderSide]
/// * [TextEditingController] for [controller]
/// * [Function] for [onChanged]
/// * [TextInputType] for [keyboardType]
/// * [bool] for [readOnly]
/// * [Function] for [validator]
/// * [bool] for [obscureText]
/// * [Function] for [onSubmitted]
/// * [TextStyle] for [textStyle]
/// * [Widget] for [label]
/// * [Color] for [filledColor]
/// * [Widget] for [suffixIcon]
/// * [TextInputFormatter] for [inputFormatters]
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.enableBorderSide,
    this.focusBorderSide,
    this.errorBorderSide,
    this.enableBorderRadius,
    this.focusBorderRadius,
    this.errorBorderRadius,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.readOnly,
    this.validator,
    this.obscureText,
    this.onSubmitted,
    this.textStyle,
    this.label,
    this.filledColor,
    this.suffixIcon,
    this.inputFormatters,
  });

  //----------> variables <----------//
  final BorderRadius? enableBorderRadius;
  final BorderRadius? focusBorderRadius;
  final BorderRadius? errorBorderRadius;
  final BorderSide? enableBorderSide;
  final BorderSide? focusBorderSide;
  final BorderSide? errorBorderSide;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final void Function(String)? onSubmitted;
  final TextStyle? textStyle;
  final Widget? label;
  final Color? filledColor;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      style: textStyle,
      inputFormatters: inputFormatters,
      //----------> decoration <----------//
      decoration: InputDecoration(
        filled: filledColor != null,
        fillColor: filledColor,
        label: label,
        suffixIcon: suffixIcon,
        //----------> enable border <----------//
        enabledBorder: OutlineInputBorder(
          borderSide:
              enableBorderSide ?? BorderSide(color: theme.colorScheme.tertiary),
          borderRadius: enableBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        //----------> focus border <----------//
        focusedBorder: OutlineInputBorder(
          borderSide:
              focusBorderSide ?? BorderSide(color: theme.colorScheme.primary),
          borderRadius: focusBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        //----------> error border <----------//
        errorBorder: OutlineInputBorder(
          borderSide:
              errorBorderSide ?? BorderSide(color: theme.colorScheme.error),
          borderRadius: errorBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        //----------> normal border <----------//
        border: OutlineInputBorder(
          borderSide:
              focusBorderSide ?? BorderSide(color: theme.colorScheme.primary),
          borderRadius: focusBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        //----------> label style <----------//
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
