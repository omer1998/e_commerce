import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/views/pages/authPage.dart';
import 'package:e_commerce/views/pages/bottomNavBar_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyFirebaseAuth auth = Provider.of<MyFirebaseAuth>(context, listen: false);
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: ((context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          if(snapshot.hasData){
            print(snapshot.data);
            return const BottomNavBar();
          }else{
            return const AuthPage();
        }
        }else{
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }

      )
    );
  }
}
