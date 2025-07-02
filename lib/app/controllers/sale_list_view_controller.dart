import 'dart:convert';

import 'package:cabzing/app/models/sale_invoice_model.dart';
import 'package:cabzing/core/constants/globals.dart';
import 'package:cabzing/core/services/api_services.dart';
import 'package:get/get.dart';

class SaleListViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  var salesList = <SalesInvoice>[].obs;
  List<SalesInvoice> originalList = [];

  Future<void> fetchData() async {
    final response = await ApiServices.fetchSalesList(
      await Globals.getUserId,
      await Globals.getToken,
    );
    if (response != null && response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final model = SaleInvoiceModel.fromJson(body);
      originalList = model.data;
      salesList.value = originalList;
    } else {
      Get.showSnackbar(
        GetSnackBar(message: 'fetch error', duration: Duration(seconds: 3)),
      );
    }
  }

  void searchSalesList(String query) {
    if (query.isEmpty) {
      salesList.value = originalList;
    } else {
      salesList.value = originalList
          .where(
            (invoice) =>
                invoice.customerName.toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                invoice.voucherNo.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }
}
