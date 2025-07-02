import 'dart:convert';

import 'package:cabzing/core/constants/globals.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<dynamic> login(String username, String password) async {
    try {
      Map<String, dynamic> body = {
        "username": username,
        "password": password,
        "is_mobile": true,
      };

      final response = await http.post(
        Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      return response;
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> fetchSalesList(int userId, String token) async {
    try {
      Map<String, dynamic> body = {
        "BranchID": 1,
        "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
        "CreatedUserID": userId,
        "PriceRounding": 2,
        "page_no": 1,
        "items_per_page": 10,
        "type": "Sales",
        "WarehouseID": 1,
      };
      final response = await http.post(
        Uri.parse("${Globals.baseUrl}/api/v10/sales/sale-list-page/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> getUserInfo(String token, int userId) async {
    try {
      final response = await http.get(
        Uri.parse('${Globals.baseUrl}/api/v10/users/user-view/$userId/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (error) {
      return null;
    }
  }
}
