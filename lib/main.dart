import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:happy_nation/bindings/dashboard_binding.dart';
import 'package:happy_nation/bindings/mood_binding.dart';
import 'package:happy_nation/bindings/storage_binding.dart';
import 'package:happy_nation/bindings/user_binding.dart';
import 'package:happy_nation/route_generator.dart';

import 'bindings/notification_binding.dart';
import 'utils/langs/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  StorageBinding().dependencies();
  // LanguageBinding().dependencies();
  UserBinding().dependencies();
  DashboardBinding().dependencies();
  NotificationBinding().dependencies();
  // LocalNotificationBinding().dependencies();
  MoodBinding().dependencies();
  // force protrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    App()
  );
}

// the app root
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // useInheritedMediaQuery: true,
        translations: Translation(),
        locale: const Locale('fr'),
        fallbackLocale: const Locale('fr'),
        title: "HappyNation Boost",
        theme: ThemeData(
          fontFamily: 'Product Sans',
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/splash',
      ),
    );
  }
}
