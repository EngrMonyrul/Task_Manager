import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/utils/constants/sizes_const.dart';
import 'package:task_manager/utils/extensions/context_ext.dart';

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
      decoration: InputDecoration(
        filled: filledColor != null,
        fillColor: filledColor,
        label: label,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide:
              enableBorderSide ?? BorderSide(color: theme.colorScheme.tertiary),
          borderRadius: enableBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              focusBorderSide ?? BorderSide(color: theme.colorScheme.primary),
          borderRadius: focusBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              errorBorderSide ?? BorderSide(color: theme.colorScheme.error),
          borderRadius: errorBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        border: OutlineInputBorder(
          borderSide:
              focusBorderSide ?? BorderSide(color: theme.colorScheme.primary),
          borderRadius: focusBorderRadius ??
              const BorderRadius.all(
                Radius.circular(SizesConsts.defaultRadius),
              ),
        ),
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
