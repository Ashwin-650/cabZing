import 'package:cabzing/app/view/landing_view/landing_view.dart';
import 'package:cabzing/app/view/login_view/login_view.dart';
import 'package:cabzing/core/constants/globals.dart';
import 'package:cabzing/core/services/shared_preferences_services.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getToLogin();
  }

  Future<void> getToLogin() async {
    final result = await SharedPreferencesServices.getValue(
      Globals.accessToken,
      '',
    );
    await Future.delayed(Duration(seconds: 3));

    if (result != '') {
      Get.off(() => LandingView());
    } else {
      Get.off(() => LoginView());
    }
  }
}
