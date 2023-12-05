import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/report.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<Report>> getReportList({required String token}) async {
  String url = '$baseApiUrl/reports';
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
        .map((data) => Report.fromJson(data));
  } catch (e) {
    return Stream.value(Report.fromJson({}));
  }
}
