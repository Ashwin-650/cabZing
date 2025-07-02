import 'dart:convert';

import 'package:cabzing/app/models/user_profile_model.dart';
import 'package:cabzing/core/constants/globals.dart';
import 'package:cabzing/core/services/api_services.dart';
import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  var userData = Rxn<UserData>();
  var customerData = Rxn<CustomerData>();

  Future<void> fetchUserInfo() async {
    final response = await ApiServices.getUserInfo(
      await Globals.getToken,
      await Globals.getUserId,
    );
    if (response != null && response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final model = UserProfileModel.fromJson(body);
      userData.value = model.data;
      customerData.value = model.customerData;
    } else {}
  }

  final List<List<String>> tiles = [
    ["badge_help", "Help"],
    ["search_status", "FAQ"],
    ["Add_Person", "Invite Friends"],
    ["shield_search", "Terms of Service"],
    ["security_safe", "Privacy Policy"],
  ];
}
