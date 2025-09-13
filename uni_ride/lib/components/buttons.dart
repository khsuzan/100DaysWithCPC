import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/themes.dart';

class MyButtonSolid extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const MyButtonSolid({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double>(
          (states) => states.contains(WidgetState.pressed) ? 2 : 8,
        ),
        shape: WidgetStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius( 
              cornerRadius: 16.w,
              cornerSmoothing: 1,
            ),
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 18.h)),
        backgroundColor: WidgetStatePropertyAll(MyColors.accent),
        shadowColor: WidgetStatePropertyAll(MyColors.buttonShadow),
        foregroundColor: WidgetStatePropertyAll(MyColors.buttonForeground),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16.sp, // Increased font size
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
