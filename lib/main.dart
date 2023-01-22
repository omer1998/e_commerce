import 'package:e_commerce/utilities/appRoutes.dart';
import 'package:e_commerce/utilities/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.authPage,
    );
  }
}
