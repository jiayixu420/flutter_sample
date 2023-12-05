import 'package:flutter/rendering.dart';

class City {
  String? id;
  String? name;

  City();

  City.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'].toString();
      name = json['name'].toString();
    } catch (e) {
      debugPrint('from Company Model => $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
