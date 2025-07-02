import 'package:get/get.dart';

class HomeViewController extends GetxController {
  RxBool isOnline = true.obs;

  void changeStatus() {
    isOnline.value = !isOnline.value;
  }

  final List<List<dynamic>> mockData = [
    [0xffF6EFED, "bookings", "bookings", "123", "reserved"],
    [0xffA9C9C5, "moneybag", "Earnings", "10,232.00", "rupees"],
    [0xffD9D6CE, "history", "History", "236", "trips"],
    [0xffACD1DB, "wallet", "Accounts", "Rs. 23,485.00", "Default account"],
  ];
}
