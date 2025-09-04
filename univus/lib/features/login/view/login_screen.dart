import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univus/components/buttons.dart';
import 'package:univus/components/textfields.dart';

import '../../../components/forms.dart';
import '../../../utils/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // Change as needed
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent, // Change as needed
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  void _showForgotPasswordEmailVerifyDialog({required BuildContext context}) {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    showDialog(
      context: context,
      builder: (context) => PhoneVerificationForm(),
      barrierDismissible: false,
      useSafeArea: true,
      barrierColor: MyColors.background.withAlpha((0.95 * 255).toInt()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/university.png",
              opacity: AlwaysStoppedAnimation(0.1),
              fit: BoxFit.cover,
              height: 0.4.sh,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback:
                          (bounds) => LinearGradient(
                            colors: [
                              MyColors.accentGreen,
                              MyColors.accentGreenTransparent,
                            ],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 42.sp,
                          color: MyColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 36.h),
                    MyTextField(hint: "Email", focusNode: _emailFocusNode),
                    SizedBox(height: 12.h),
                    MyTextField(
                      hint: "Password",
                      focusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            _showForgotPasswordEmailVerifyDialog(
                              context: context,
                            );
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Padding(
                            padding: EdgeInsets.all(8.w).copyWith(right: 0),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: MyColors.white.withAlpha(
                                  (0.5 * 255).toInt(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    MyButtonSolid(text: "Login", onPressed: () {}),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Register",
                            style: TextStyle(color: MyColors.accentGreen),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
