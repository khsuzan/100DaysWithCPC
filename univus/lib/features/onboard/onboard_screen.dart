import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D384D),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 0.5.sh, width: 0.9.sw, child: Placeholder()),
            // title
            ShaderMask(
              shaderCallback:
                  (bounds) => LinearGradient(
                    colors: [Color(0xFF66FF8C), Color(0x3066FF8C)],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Text(
                "Univus",
                style: TextStyle(
                  fontSize: 48.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // sub title
            ShaderMask(
              shaderCallback:
                  (bounds) => LinearGradient(
                    colors: [Color(0xFFFFFFFF), Color(0x25FFFFFF)],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Text(
                "Empowering Minds, Shaping Futures.",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
