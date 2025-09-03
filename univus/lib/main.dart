import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlayStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:univus/routes/routes.dart';
import 'package:univus/utils/themes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: MyColors.accentGreen,
              selectionColor: MyColors.whiteTransparent.withAlpha(100),
              selectionHandleColor: MyColors.whiteTransparent.withAlpha(100),
            ),
          ),
          routerConfig: router,
        );
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // Change as needed
      systemNavigationBarContrastEnforced: false,
      statusBarColor: Colors.transparent, // Change as needed
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MainApp());
}
