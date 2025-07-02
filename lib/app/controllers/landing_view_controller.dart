import 'package:get/get.dart';

class LandingViewController extends GetxController {
  RxInt pageindex = 0.obs;

  void changeIndex(int index) {
    pageindex.value = index;
  }
}
