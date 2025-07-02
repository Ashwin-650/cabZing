import 'package:cabzing/core/services/shared_preferences_services.dart';

class Globals {
  static const String baseUrl = "https://www.api.viknbooks.com";
  static const String accessToken = "accessToken";
  static const String userId = "userId";

  static Future<dynamic> get getUserId =>
      SharedPreferencesServices.getValue(userId, 0);
  static Future<dynamic> get getToken =>
      SharedPreferencesServices.getValue(accessToken, '');
}
