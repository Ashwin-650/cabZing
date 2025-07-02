import 'package:get/get.dart';

class FilterViewController extends GetxController {
  RxInt filterIndex = 0.obs;
  final filters = ["pending", "Invoiced", "Cancelled"];

  void changeIndex(int index) {
    filterIndex.value = index;
  }
}
