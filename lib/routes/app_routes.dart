import 'package:flutter/cupertino.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String loginPage = '/login';

  static Map<String, WidgetBuilder> mRoutes = {
    splash: (_) => SplashPage(),
    loginPage: (_) => LoginPage(),
  };
}