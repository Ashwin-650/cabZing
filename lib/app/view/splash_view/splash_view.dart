import 'package:cabzing/app/controllers/splash_view_controller.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final ctrl = Get.put(SplashViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppSvg(assetName: 'cabzing_logo')),
    );
  }
}
