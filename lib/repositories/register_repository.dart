import 'package:get/get.dart';
import 'package:happy_nation/constants/services/server.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/models/user.dart';
import 'package:happy_nation/providers/service_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// register method
Future<Stream<User>> register(User user) async {
  try {
    String url = '$baseApiUrl/register';
    final client = http.Client();
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    if (user.checkHasMedia) {
      request.files
          .add(await http.MultipartFile.fromPath('image', user.image!));
    }
    request.headers.addAll(Helper.customHeader());
    request.fields.addAll(user.registerToJson());
    final response = await client.send(request);

    if (response.statusCode == 200) {
      return response.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((data) => Helper.getData(data))
          .map((data) => User.fromJson(data));
      // return User.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Invalid Data');
      // throw Exception(response.stream
      //     .transform(utf8.decoder)
      //     .transform(json.decoder)
      //     .map((data) => Helper.getErrors(data)));
      // .map((data) => Helper.validationMessage(data));
    }
  } catch (e) {
    throw Exception('Invalid Data');
  }
}

Future<Response> registerData() async {
  String url = '$baseApiUrl/register-data';
  var response = await ServiceProvider().getData(url);
  return response;
}
