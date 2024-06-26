import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/common/providers/common_provider.dart';
import 'package:task_manager/common/widgets/custom_background.dart';
import 'package:task_manager/common/widgets/custom_button.dart';
import 'package:task_manager/common/widgets/custom_text_form_field.dart';
import 'package:task_manager/pdfDownload/downloader.dart';
import 'package:task_manager/utils/constants/assets_const.dart';
import 'package:task_manager/utils/constants/components_const.dart';
import 'package:task_manager/utils/constants/sizes_const.dart';
import 'package:task_manager/utils/extensions/context_ext.dart';
import 'package:task_manager/views/login/providers/login_provider.dart';

import '../widgets/socail_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void pressOnSubmit(String value) {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      pressedOnLogin();
    }
  }

  void pressedOnLogin() async {
    final loginProvider = context.read<LoginProvider>();
    final commonProvider = context.read<CommonProvider>();
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      if (loginProvider.login!.isValid) {
        commonProvider.setLoading();
        await loginProvider.loginIn();
        commonProvider.setLoading();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    return Consumer2<LoginProvider, CommonProvider>(
      builder: (context, loginProvider, commonProvider, child) {
        return CustomBackground(
          padding: const EdgeInsets.all(SizesConsts.defaultPadding),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * .15,
                    ),
                    Text(
                      "Task Manager",
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Please Login to Continue with Us",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .1,
                    ),
                    CustomTextFormField(
                      onSubmitted: pressOnSubmit,
                      label: const Text(
                        "Username or Email",
                      ),
                      onChanged: (value) {
                        loginProvider.setLogin(email: value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      filledColor: theme.colorScheme.tertiary.withOpacity(0.1),
                      textStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value == null || value == "" || value.isEmpty) {
                          return "username required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    CustomTextFormField(
                      onSubmitted: pressOnSubmit,
                      label: const Text(
                        "Password",
                      ),
                      onChanged: (value) {
                        loginProvider.setLogin(password: value);
                      },
                      filledColor: theme.colorScheme.tertiary.withOpacity(0.1),
                      obscureText: loginProvider.showPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginProvider.setShowPassword();
                        },
                        icon: Icon(
                          loginProvider.showPassword
                              ? CupertinoIcons.eye_fill
                              : CupertinoIcons.eye_slash_fill,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      textStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      validator: (value) {
                        if (value == null || value == "" || value.isEmpty) {
                          return "password required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: screenSize.height * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          side: BorderSide(color: theme.colorScheme.onPrimary),
                          checkColor: theme.colorScheme.primary,
                          fillColor: WidgetStatePropertyAll(
                              theme.colorScheme.onPrimary),
                          value: loginProvider.rememberMe,
                          onChanged: (value) {
                            loginProvider.setRememberMe(remember: value!);
                          },
                        ),
                        Text(
                          "Remember Me for 7 Days",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (commonProvider.loading)
                      const CircularProgressIndicator(),
                    if (!commonProvider.loading)
                      CustomButton(
                        onPressed: pressedOnLogin,
                        child: SizedBox(
                          height: screenSize.height * .06,
                          width: screenSize.width,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: screenSize.height * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          child: Text(
                            "Sign up now!",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * .1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: screenSize.width * .4,
                          child: const SocialLoginButton(
                            title: "Facebook",
                            subTitle: "Login with Facebook",
                            image: AssetsConst.icFacebook,
                          ),
                        ),
                        Text(
                          "or",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomButton(
                          width: screenSize.width * .4,
                          child: const SocialLoginButton(
                            title: "Google",
                            subTitle: "Login with Google",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * .1,
                    ),
                    Text(
                      ComponentsConst.appVersion,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
