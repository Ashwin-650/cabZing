import 'package:cabzing/app/controllers/landing_view_controller.dart';
import 'package:cabzing/app/view/home_view/home_view.dart';
import 'package:cabzing/app/view/landing_view/widgets/app_bottom_nav.dart';
import 'package:cabzing/app/view/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});
  List<Widget> get pages {
    return [HomeView(), HomeView(), HomeView(), ProfileView()];
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(LandingViewController());
    return Obx(
      () => Scaffold(
        body: pages[ctrl.pageindex.value],
        bottomNavigationBar: AppBottomNav(
          onTap: (index) {
            ctrl.changeIndex(index);
          },
          currentIndex: ctrl.pageindex.value,
        ),
      ),
    );
  }
}
