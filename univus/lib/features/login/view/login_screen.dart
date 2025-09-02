import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univus/components/buttons.dart';

import '../../../utils/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171B22),
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: MyColors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.accentGreen),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.accentGreen,
                          width: 2,
                        ),
                      ),
                    ),
                    style: TextStyle(color: MyColors.white),
                  ),
                  TextField(),
                  SizedBox(height: 16.h),
                  MyButtonSolid(text: "Login"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
