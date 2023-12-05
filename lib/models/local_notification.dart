import 'package:flutter/rendering.dart';

class LocalNotification {
  int? id;
  String? notification;
  String? time;

  LocalNotification.init();

  LocalNotification({
    required this.notification,
    required this.time,
  });

  LocalNotification.fromJson(Map<String, dynamic> json) {
    try {
      id = int.parse(json['id'].toString());
      notification = json['notification'];
      time = json['time'];
    } catch (e) {
      debugPrint('from Notification Model => $e');
    }
  }
}
