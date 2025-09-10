import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/themes.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hint;
  final Widget? icon;
  const MyTextField({super.key, this.controller,this.focusNode, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffix: icon,
        hintText: hint,
        hintStyle: TextStyle(
          color: MyColors.white.withAlpha((0.5 * 255).toInt()),
        ),
        filled: true,
        fillColor: MyColors.accentGreen.withAlpha(10),
        contentPadding: EdgeInsets.all(20.w),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.whiteTransparent),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 16.w,
            cornerSmoothing: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.accentGreen),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 16.w,
            cornerSmoothing: 1,
          ),
        ),
      ),
      style: TextStyle(color: MyColors.accentGreen),
      controller: controller,
      focusNode: focusNode,
    );
  }
}
