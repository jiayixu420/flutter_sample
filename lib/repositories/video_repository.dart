import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<Video>> getVideoList({required String token}) async {
  String url = '$baseApiUrl/videos';
  final client = http.Client();
  final streamedRest = await client.send(
    http.Request('get', Uri.parse(url))
      ..headers.addAll(
        Helper.customHeader(
          token: token,
        ),
      ),
  );
  try {
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => Video.fromJson(data));
  } catch (e) {
    return Stream.value(Video.fromJson({}));
  }
}
