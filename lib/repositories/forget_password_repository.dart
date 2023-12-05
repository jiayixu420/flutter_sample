import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// login method
Future<String> sendLinkToEmail(User user) async {
  String url = '$baseApiUrl/forgot-password';
  final client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: Helper.customHeader(),
    body: json.encode(user.resetPassToJson()),
  );
  if (response.statusCode == 200) {
    return (json.decode(response.body)['data']).toString();
  } else {
    throw Exception(json.decode(response.body)['message']);
  }
}

Future<String> sendCodeToEmail(User user) async {
  String url = '$baseApiUrl/send-code';
  final client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: Helper.customHeader(),
    body: json.encode(user.resetPassToJson()),
  );
  if (response.statusCode == 200) {
    return (json.decode(response.body)['data']).toString();
  } else {
    throw Exception(json.decode(response.body)['message']);
  }
}
