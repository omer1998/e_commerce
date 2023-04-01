import 'package:e_commerce/utilities/appRoutes.dart';
import 'package:e_commerce/utilities/authStatus.dart';
import 'package:e_commerce/views/sharedWidgets/auth_btn_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  var _authPage = AuthPageType.login;
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset:
          //     false, // this make the keyboard float in order to not take space of screen
          body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _authPage == AuthPageType.login
                      ? "Login"
                      : "Register", //to change the text here according to the page type
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 33,
                ),
                TextFormField(
                    focusNode: emailFocus,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(passwordFocus),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else {
                        return null;
                      }
                      // or in other way
                      //(value)=> value?.trim().isEmpty == true ? "This field is required" : null  null here mean the input is valid
                    },
                    decoration: const InputDecoration(label: Text("E-mail"))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    onEditingComplete: () {
                      // this will submit user info whether login or sign up when the user press the done button of the keyboard
        
                      if (_authPage == AuthPageType.login) {
                        if (_formKey.currentState!.validate()) {
                          print("valid login");
                        }
                      }else{
                        if (_formKey.currentState!.validate()) {
                          print("valid register");
                        }
                      }
                    },
                    textInputAction: TextInputAction.done,
                    // this code will make the keyboard done button to submit the form
                    focusNode: passwordFocus,
                    validator: (value) => value?.trim().isEmpty == true
                        ? "This field is required"
                        : null,
                    decoration: const InputDecoration(
                        label: Text("Password"),
                        hintText: "Enter your password")),
                const SizedBox(
                  height: 18,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(_authPage == AuthPageType.login
                        ? "Forget your password"
                        : " ")),
                const SizedBox(
                  height: 18,
                ),
                // as we have the same button in multiple pages
                //it's good approach to create it as a custom widget that is applicable in multiple situation
        
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: AuthButton(
                        action: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, AppRoutes.bottomNavBarPage);
                            print("valid");
                          }
                        },
                        btnName: _authPage == AuthPageType.register
                            ? "Register"
                            : "Login")),
        
                const SizedBox(
                  height: 18,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(_authPage == AuthPageType.login
                        ? "Not having an account? Register"
                        : "Have an account? Login"),
                    onTap: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        if (_authPage == AuthPageType.login) {
                          _authPage = AuthPageType.register;
                        } else {
                          _authPage = AuthPageType.login;
                        }
                      });
                    },
                  ),
                ),
        
                // add spacer widget
                // const Spacer(),
                //  instread of using spacer widget we can size box with specific height (i use mediaquery to get the height of the screen)
                SizedBox(
                  height: pageSize.height * 0.11,
                ),
                // (_authPage == AuthPageType.register)
                //     ? Text(
                //         "This is the registeration page",
                //         style: Theme.of(context).textTheme.headline4,
                //       )
                //     : Text("This is the login page",
                //         style: Theme.of(context).textTheme.headline4),
        
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _authPage == AuthPageType.login
                            ? "Or login with"
                            : "Or register with",
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
        ),
      )),
    );
  }
}
