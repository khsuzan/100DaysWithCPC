import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WallpaperViewScreen extends StatelessWidget {
  final String imagePath;
  const WallpaperViewScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 48.h),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement set as wallpaper functionality
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Text(
                  'Set as Wallpaper',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
