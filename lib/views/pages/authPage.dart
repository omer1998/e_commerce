import 'package:e_commerce/views/sharedWidgets/authButton.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextFormField(),
              const SizedBox(
                height: 10,
              ),
              TextFormField(),
              const SizedBox(
                height: 12,
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forget your password ?")),
              const SizedBox(
                height: 12,
              ),
              // as we have the same button in multiple pages
              //it's good approach to create it as a custom widget that is applicable in multiole situation

              SizedBox(width: double.infinity,
                child: AuthButton(action: () {}, btnName: "Login")),

              // add spacer widget
              const Spacer(),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Or login with",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.grey,
                    width: 40.0,
                    height: 40.0,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 8),
                  Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                      child: const Icon(Icons.add))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
