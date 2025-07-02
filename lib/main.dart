import 'package:cabzing/app/view/splash_view/splash_view.dart';
import 'package:cabzing/core/style/app_font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      ensureScreenSize: false,
      splitScreenMode: false,
      minTextAdapt: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontFamily: poppins5Medium,
            ),
          ),
          scaffoldBackgroundColor: Colors.black,
        ),
        home: SplashView(),
      ),
    );
  }
}
