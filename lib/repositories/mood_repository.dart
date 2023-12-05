import 'package:flutter/rendering.dart';
import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/mood.dart';
import 'package:happy_nation/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// login method
Future<dynamic> postMood({required User user, required Mood mood}) async {
  String url = '$baseApiUrl/user-mood';
  final client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: Helper.customHeader(token: user.token),
    body: json.encode({'mood_range': mood.moodRange}),
  );
  debugPrint(response.body);
  if (response.statusCode == 200) {
  } else {
    throw Exception(json.decode(response.body)['message']);
  }
}
