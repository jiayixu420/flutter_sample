import 'package:happy_nation/helpers/helper.dart';

class Company {
  // int? id;
  String? name;
  String? code;

  Company();

  Company.fromJson(Map<String, dynamic> json) {
    try {
      // id = json['id'];
      name = json['name'] ?? '';
      code = json['code'] ?? '';
    } catch (e) {
      Helper.printConsole('from Company Model => $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
