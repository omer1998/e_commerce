

import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/utilities/authStatus.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier{
  final AuthBase auth;
  String email;
  String password;
  AuthPageType authPageType;

AuthController({
  required this.auth,
  this.email = "",
  this.password = "",
  this.authPageType = AuthPageType.login
});

get authPage => authPageType;

void toggleAuthPageType(){
  copyWith(authPageType: authPageType == AuthPageType.login ? AuthPageType.register : AuthPageType.login);
}

void updateEmail(String? email){
  copyWith(email: email);
}

void updatePassword(String? password){
  copyWith(password: password);
}

void copyWith({
  String? email,
  String? password,
  AuthPageType? authPageType
}){
  this.email = email ?? this.email;
  this.password = password ?? this.password;
  this.authPageType = authPageType ?? this.authPageType;
  notifyListeners();
}

Future<void> submit() async {
  
    switch(authPageType) {
    case AuthPageType.login:
     await auth.signInWithEmailAndPassword(email, password);
      break;
    case AuthPageType.register:
      await auth.createUserWithEmailAndPassword(email, password);
      break;
    // default:break;
  } 

  
}

Future<void> logOut() async {
  await auth.signOut();
}

}