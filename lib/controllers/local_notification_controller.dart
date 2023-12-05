import 'dart:convert';

import 'package:get/get.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/controllers/language_controller.dart';
import 'package:happy_nation/models/local_notification.dart';
import 'package:happy_nation/repositories/local_notification_repository.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'storage_controller.dart';

class LocalNotificationController extends GetxController {
  var notifications = <LocalNotification>[].obs;
  var storageController = Get.put(StorageController());

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  onInit() {
    super.onInit();
    // listenForListOfNotification();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  initLocalNotif() {
    var androidInitilize =
    const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initilizationsSettings =
    InitializationSettings(android: androidInitilize);
    var fltrNotification = FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings);
    tz.initializeTimeZones();
    var zone = tz.getLocation('Africa/Casablanca');
    tz.setLocalLocation(zone);
    checkNextNotifSetup();
  }

  /// Set right date and time for notifications
  tz.TZDateTime convertTime(int hour, int minutes, {int days = 1}) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    // if (scheduleDate.isBefore(now)) {
    scheduleDate = scheduleDate.add(Duration(days: days));
    // }
    return scheduleDate;
  }

  cancellAll() async {
    // cancell all pending notification for make new update
    await flutterLocalNotificationsPlugin!.cancelAll();
  }

// var datetime = tz.TZDateTime.from(DateTime.now(), zone);
  // var datetime = tz.TZDateTime.from(DateTime(2022, 6, 12, 15, 02), zone)
  //     .add(const Duration(seconds: 5));
  Future<void> setNotifs() async {
    cancellAll();
    int days = 0;
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_stat_vector');
    // const iOSinitilize = IOSInitializationSettings();

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin!.initialize(initializationSettings);
    // set notif in local
    for (var notification in notifications) {
      var times = notification.time!.split(':');
      var datetime =
      convertTime(int.parse(times[0]), int.parse(times[1]), days: days++);

      await flutterLocalNotificationsPlugin!.zonedSchedule(
        notification.id!,
        '',
        "HappyNation Boost", // Change the notification message here
        datetime,
        NotificationDetails(
          android: AndroidNotificationDetails(
            notification.id.toString(),
            "HappyNation Boost", // Change the notification message here
            channelDescription: "HappyNation Boost", // Change the notification description here
            color: orangeColor,
            largeIcon: const DrawableResourceAndroidBitmap('clock_notif'),
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );
    }

    setNewNotifSetup(days);
  }

  void setNewNotifSetup(int days) {
    String date = DateFormat("yyyy-MM-dd hh:mm:ss")
        .format(DateTime.now().add(Duration(days: days)));
    storageController.setData(
        data: jsonEncode(date.toString()), key: 'next_notif_setup');

    // Helper.customSnackBar(
    //   title: ConstantTexts.profile,
    //   message: ConstantTexts.initializationComplete,
    //   snackPosition: SnackPosition.TOP,
    // );
  }

  void checkNextNotifSetup() {
    if (storageController.hasData(key: 'next_notif_setup')) {
      var date = storageController.getData(key: 'next_notif_setup');

      DateTime tempDate =
      DateFormat("yyyy-MM-dd hh:mm:ss").parse(jsonDecode(date));
      var isAfter = tempDate.isAfter(DateTime.now());
      if (!isAfter) {
        setNotifs();
      }
    } else {
      setNotifs();
    }
  }

  // get list of Local Notifications
  Future<void> listenForListOfNotification() async {
    final Stream<LocalNotification> stream = await getLocalNotificationList(
      lang: Get.find<LanguageController>().currentLanguage,
    );
    stream.listen(
          (LocalNotification _notif) {
        notifications.add(_notif);
      },
      onError: (a) {},
      onDone: () {
        initLocalNotif();
      },
    );
  }

  Future<void> checkPendingNotificationRequests() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
    await flutterLocalNotificationsPlugin!.pendingNotificationRequests();
  }
}

