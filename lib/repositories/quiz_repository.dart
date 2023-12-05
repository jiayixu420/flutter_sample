import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<Question>> getQuestionList(
    {required String token, required String lang}) async {
  String url = '$baseApiUrl/quiz?lang=$lang';
  final client = http.Client();
  final streamedRest = await client.send(
    http.Request('get', Uri.parse(url))
      ..headers.addAll(
        Helper.customHeader(token: token),
      ),
  );
  try {
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => Question.fromJson(data));
  } catch (e) {
    return Stream.value(Question.fromJson({}));
  }
}

// login method
Future<dynamic> sendQuizResult(
    {required String token,
    required double points,
    required String lang}) async {
  String url = '$baseApiUrl/user-quiz';
  final client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: Helper.customHeader(token: token),
    body: json.encode({'points': points, 'lang': lang}),
  );
  if (response.statusCode == 200) {
    Helper.printConsole(json.decode(response.body)['data']);
    return json.decode(response.body)['data'];
  } else {
    throw Exception(json.decode(response.body)['message']);
  }
}
