import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlayStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // Change as needed
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent, // Change as needed
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
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
              "assets/images/onboard_graph.png",
              opacity: AlwaysStoppedAnimation(0.1),
              height: 0.7.sh,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 0.5.sh,
                      width: 0.9.sw,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              Color.fromARGB(255, 102, 255, 140),
                              Color.fromARGB(87, 102, 255, 140),
                              Color(0x0066FF8C),
                            ],
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/robo.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Spacer(),
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
                          fontSize: 54.sp,
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
                    SizedBox(height: 24.h),
                    // button
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.resolveWith<double>(
                          (states) =>
                              states.contains(WidgetState.pressed) ? 2 : 8,
                        ),
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 18.h),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xFF66FF8C),
                        ),
                        shadowColor: WidgetStatePropertyAll(Color(0x7B66FF8C)),
                        foregroundColor: WidgetStatePropertyAll(
                          Color(0xFB0A1A0E),
                        ),
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(
                            fontSize: 16.sp, // Increased font size
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.push("/login");
                      },
                      child: Text("Get Started"),
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
