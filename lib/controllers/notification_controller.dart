import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/helpers/helper.dart';

import 'user_controller.dart';

class NotificationController extends GetxController {
  var firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? fltNotification;
  var userController = Get.put(UserController());
  String? token;
  var loading = false.obs;
  var notificationCount = 0.obs;

  @override
  void onInit() {
    notitficationPermission();
    initMessaging();
    onMessageOpenUp();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    subscribeToTopic(topic: 'happy_nation_global');
  }

  String get getDeviceToken => token!;

  void addData({int count = 0}) {
    notificationCount.value = count;
    update();
  }

  Future<void> getToken() async {
    token = await firebaseMessaging.getToken();
    debugPrint('user token = => $token');
  }

  void subscribeToTopic({required String topic}) {
    firebaseMessaging.subscribeToTopic(topic);
    debugPrint('subscribeToTopic : $topic');
  }

  void unSubscribeToTopic({required String topic}) {
    firebaseMessaging.unsubscribeFromTopic(topic);
    debugPrint('unsubscribeFromTopic : $topic');
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  void initMessaging() {
    var androidInitilize =
    const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initilizationsSettings =
    InitializationSettings(android: androidInitilize);
    var fltrNotification = FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(
        body: message.notification?.body ?? '',
        title: "HappyNation Boost",
        id: message.messageId!,
      );
    });
  }

  void onMessageOpenUp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      showNotification(
        body: message.notification?.body ?? '',
        title: message.notification?.title ?? '',
        id: message.messageId!,
      );
      Helper.customSnackBar(
        title: message.notification?.title ?? '',
        message: message.notification?.body ?? '',
        snackPosition: SnackPosition.TOP,
      );
      debugPrint(
        'A new onMessageOpenedApp event was published! ${message.notification!.body}',
      );
    });
  }

  void showNotification({String? id, String? body, String? title}) async {
    int id = 0;
    fltNotification = FlutterLocalNotificationsPlugin();
    var androidDetails = AndroidNotificationDetails(
      'HappyNation Boost',
      'HappyNation Boost',
      channelDescription: title ?? 'hpns desc',
      color: orangeColor,
      largeIcon: const DrawableResourceAndroidBitmap('clock_notif'),
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    var generalNotificationDetails =
    NotificationDetails(android: androidDetails);

    await fltNotification!.show(++id, 'HappyNation Boost', body, generalNotificationDetails,
        payload: 'Notification');
  }

  void notitficationPermission() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
