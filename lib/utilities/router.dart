import 'package:e_commerce/main.dart';
import 'package:e_commerce/views/pages/authPage.dart';
import 'package:e_commerce/views/pages/landingPage.dart';
import 'package:e_commerce/views/pages/product_details_page.dart';
import 'package:flutter/cupertino.dart';
import '../models/product_model.dart';
import '../views/pages/bottomNavBar_page.dart';
import 'appRoutes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authPage:
      return CupertinoPageRoute(builder: (context) => const AuthPage(), settings: settings);
    case AppRoutes.bottomNavBarPage:
      return CupertinoPageRoute(builder: (context)=> const BottomNavBar(), settings: settings);
    case AppRoutes.productDetailPage:
    final product = settings.arguments as Product;
      return CupertinoPageRoute(builder:(context) => ProductDetails(product: product), settings: settings);
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage(), settings: settings);
  }
}
