import 'package:get/get.dart';
import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/models/user.dart';
import 'package:happy_nation/providers/service_provider.dart';

class UserRepository {
  static Future<Response> deleteAccount({required User user}) async {
    String url = '$baseApiUrl/remove-account';
    var response = await ServiceProvider().postData(url, {}, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${user.token}',
    });
    return response;
  }
}
