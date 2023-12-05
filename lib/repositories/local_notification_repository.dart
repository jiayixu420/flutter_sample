import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/local_notification.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<LocalNotification>> getLocalNotificationList(
    {required String lang}) async {
  String url = '$baseApiUrl/notifications?lang=$lang';
  final client = http.Client();
  final streamedRest = await client.send(
    http.Request('get', Uri.parse(url))
      ..headers.addAll(
        Helper.customHeader(),
      ),
  );
  try {
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => LocalNotification.fromJson(data));
  } catch (e) {
    return Stream.value(LocalNotification.fromJson({}));
  }
}
