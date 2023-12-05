import 'package:flutter/material.dart';
import 'package:happy_nation/screens/guest/home/guest_home.dart';
import 'package:happy_nation/screens/guest/onboarding/onboarding_screen.dart';
import 'package:happy_nation/screens/guest/register/register_screen.dart';
import 'package:happy_nation/screens/splash/splash_screen.dart';
import 'package:happy_nation/screens/user/Login/login_screen.dart';
import 'package:happy_nation/screens/user/dashboard/dashboard.dart';
import 'package:happy_nation/screens/user/forget_password/forgot_password.dart';
import 'package:happy_nation/screens/user/forget_password/parts/reset_password.dart';
import 'package:happy_nation/screens/user/master_classes/master_classes.dart';
import 'package:happy_nation/screens/user/master_classes/parts/video_component.dart';
import 'package:happy_nation/screens/user/quizz/complete/complete_quizz.dart';
import 'package:happy_nation/screens/user/quizz/home/home_quizz.dart';
import 'package:happy_nation/screens/user/report/report_viewer.dart';
import 'package:happy_nation/screens/user/settings/change_password/change_password.dart';
import 'package:happy_nation/screens/user/welcome/welcome_screen.dart';

import 'models/route_argument.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case '/guest-home':
        return MaterialPageRoute(builder: (_) => const GuestHome());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/forget-password':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case '/reset-password':
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeUserScreen());
      case '/home-quizz':
        return MaterialPageRoute(
            builder: (_) => const HomeQuizz(),
            settings: const RouteSettings(name: "home-quizz"));
      case '/complete-quizz':
        return MaterialPageRoute(builder: (_) => const CompleteQuizz());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/master-classes':
        return MaterialPageRoute(builder: (_) => const MasterClassesScreen());
      case '/video-screen':
        return MaterialPageRoute(
            builder: (_) =>
                VideoScreen(routeArgument: (args as RouteArgument)));
      case '/report-viewer':
        return MaterialPageRoute(builder: (_) => const ReportViewer());
      case '/change-password':
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      default:
        return MaterialPageRoute(builder: (_) => const GuestHome());
    }
  }
}
