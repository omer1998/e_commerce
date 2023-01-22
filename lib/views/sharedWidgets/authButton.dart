
import 'package:flutter/material.dart';


class AuthButton extends StatelessWidget {
  final String btnName;
  final VoidCallback action;
   const AuthButton({super.key,required this.action,required this.btnName });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:action, child: Text(btnName));
  }
}