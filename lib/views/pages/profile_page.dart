import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/controllers/firestore_controller_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Consumer<AuthController>(
                builder:(_, authController, __){
                  return ElevatedButton(
                  onPressed: () {
                    // authController.logOut(); // in case of using consumer
                    // or in other way
                    // context.read<AuthController>().logOut();
                    // or in other way
                    Provider.of<AuthController>(context, listen: false).logOut();
                    Provider.of<FirestoreController>(context, listen: false).deleteData("users/12345678");

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text("Log out"),
                );
                }

              ),
            ),
          )
        ],
      ),
    );
  }
}
