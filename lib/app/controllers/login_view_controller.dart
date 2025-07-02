import 'dart:convert';

import 'package:cabzing/app/view/landing_view/landing_view.dart';
import 'package:cabzing/core/services/api_services.dart';
import 'package:cabzing/core/services/shared_preferences_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  RxBool isObsecure = true.obs;
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  void changeObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  Future<void> signIn() async {
    final response = await ApiServices.login(userName.text, password.text);
    if (response != null && response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final token = body["data"]["access"];
      final userId = body["data"]["user_id"];
      SharedPreferencesServices.setValue('accessToken', token);
      SharedPreferencesServices.setValue('userId', userId);
      Get.off(() => LandingView());
    } else {
      Get.showSnackbar(
        GetSnackBar(
          message: 'Error Signing in',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
