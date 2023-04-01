import 'package:e_commerce/main.dart';
import 'package:e_commerce/views/pages/authPage.dart';
import 'package:e_commerce/views/pages/landingPage.dart';
import 'package:flutter/cupertino.dart';
import '../views/pages/bottomNavBar_page.dart';
import 'appRoutes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authPage:
      return CupertinoPageRoute(builder: (context) => const AuthPage(), settings: settings);
    case AppRoutes.bottomNavBarPage:
      return CupertinoPageRoute(builder: (context)=> const BottomNavBar(), settings: settings);
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage(), settings: settings);
  }
}
