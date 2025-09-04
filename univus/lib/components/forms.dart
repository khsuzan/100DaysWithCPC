import 'dart:math';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/themes.dart';
import 'buttons.dart';
import 'textfields.dart';

class PhoneVerificationForm extends StatefulWidget {
  const PhoneVerificationForm({super.key});

  @override
  State<PhoneVerificationForm> createState() => _PhoneVerificationFormState();
}

class _PhoneVerificationFormState extends State<PhoneVerificationForm> {
  @override
  Widget build(BuildContext context) {
    print(1.sw - 320.w);
    return Dialog( 
      backgroundColor: MyColors.backgroundLight,
      insetPadding: EdgeInsets.all(max(16.w, (1.sw - 360.w) / 2)), 
      shadowColor: MyColors.black.withAlpha(140),
      elevation: 20,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 16.w,
          cornerSmoothing: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
                "Verify Mobile Number",
                style: TextStyle(
                  fontSize: 42.sp,
                  color: MyColors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 36.h),
            MyTextField(hint: "Email"),
            SizedBox(height: 16.h),
            MyButtonSolid(text: "Send OTP", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
