import 'package:e_commerce/views/sharedWidgets/authButton.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // this make the keyboard float in order to not take space of screen 
          body: Form(
            key: _formKey,
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
              const SizedBox(height: 33,),
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please this field is required";
                  }else{
                    return null;
                  }
                  // or in other way 
                  //(value)=> value?.trim().isEmpty == true ? "This field is required" : null  null here mean the input is valid
                },
                decoration: const InputDecoration(label: Text("E-mail"))
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value)=> value?.trim().isEmpty == true ? "This field is required" : null,
                decoration:  const InputDecoration( label: Text("Password"), hintText: "Enter your password")
              ),
              const SizedBox(
                height: 18,
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forget your password ?")),
              const SizedBox(
                height: 18,
              ),
              // as we have the same button in multiple pages
              //it's good approach to create it as a custom widget that is applicable in multiole situation
              
              SizedBox(width: double.infinity,height: 50,
                child: AuthButton(action: (){} , btnName: "Login")),

                const SizedBox(height: 18,),
               Align(
                alignment: Alignment.center,
                 child: InkWell(child: const Text("Not having an account? Register", ),
                             onTap: () {
                             },),
               ),

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
