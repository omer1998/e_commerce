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
        
        primaryColor: Colors.red,
        scaffoldBackgroundColor: const Color(0xffE5E5E5),

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.subtitle1,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey)),

          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey)),
          
          //disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)) // i think this activate if the 
        )
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.authPage,
    );
  }
}
