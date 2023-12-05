import 'package:flutter/material.dart';
import 'package:happy_nation/models/city.dart';

class Register {
  List<City>? cities;
  Register();

  Register.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      cities =
          jsonMap['cities'] != null && (jsonMap['cities'] as List).isNotEmpty
              ? List.from(jsonMap['cities'])
                  .map((element) => City.fromJson(element))
                  .toList()
              : [];
    } catch (e) {
      debugPrint('from Register ==== > $e');
    }
  }
}
