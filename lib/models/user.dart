import 'package:happy_nation/models/company.dart';
import 'package:happy_nation/helpers/helper.dart';

class User {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? cPassword;
  String? currentPassword;
  Company? company;
  String? token;
  String? lang;
  String? gender;
  String? function;
  String? age;
  String? city;
  String? image;
  bool? hasMedia;
  String? resetPassCode;

  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.cPassword,
    this.company,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      email = json['email'];
      phone = json['phone'];
      image = json['image'];
      lang = json['lang'] ?? 'en';
      hasMedia = json['has_media'] ?? false;
      // company = json['company'] == null
      //     ? Company()
      //     : Company.fromJson(json['company']);
      token = json['token'];
    } catch (e) {
      Helper.printConsole('from User Model => $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['has_media'] = hasMedia;
    data['image'] = image ?? '';
    data['lang'] = lang ?? 'en';
    // data['company'] = company!.toJson();
    data['token'] = token;
    return data;
  }

  Map<String, String> registerToJson() {
    final Map<String, String> data = <String, String>{};
    data['name'] = name.toString();
    data['email'] = email.toString();
    data['phone'] = phone.toString();
    data['city'] = city.toString();
    data['gender'] = gender.toString();
    data['function'] = function.toString();
    data['age'] = age.toString();
    data['password'] = password.toString();
    data['c_password'] = cPassword.toString();
    if (company!.code!.isNotEmpty) {
      data['company_code'] = company!.code.toString();
    }
    return data;
  }

  Map<String, dynamic> toLogin() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = email;
    data['password'] = password;
    return data;
  }

  Map<String, dynamic> resetPassToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['code'] = resetPassCode;
    return data;
  }

  Map<String, dynamic> newPassToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old_password'] = currentPassword;
    data['new_password'] = password;
    return data;
  }

  String get firstName => name!.split(' ').first;

  // check if user has image
  bool get checkHasMedia => !([null, '']).contains(image);
}
