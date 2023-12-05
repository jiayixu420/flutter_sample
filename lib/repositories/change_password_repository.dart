import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// login method
Future<String> changePassword(User user) async {
  String url = '$baseApiUrl/change-password';
  final client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: Helper.customHeader(token: user.token),
    body: json.encode(user.newPassToJson()),
  );
  if (response.statusCode == 200) {
    return json.decode(response.body)['message'];
  } else {
    throw Exception(json.decode(response.body)['message']);
  }
}
