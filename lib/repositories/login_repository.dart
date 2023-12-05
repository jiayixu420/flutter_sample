import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// login method
Future<User> login(User user) async {
  String url = '$baseApiUrl/login';
  final client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: Helper.customHeader(),
    body: json.encode(user.toLogin()),
  );
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception(json.decode(response.body)['message']);
  }
}
