import 'dart:js';

import 'package:firebaseflutterlogin/screes/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../reuseable/reuseable.dart';
import '../utils/colors.dart';
import 'home.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("6e2945"),
              hexStringToColor("6e2945"),
              hexStringToColor("9598a3")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/craib.png"),
                //text field(placeholder, icon, type:password?, controllerName)
                reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(height: 20,),
                reusableTextField("Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                const SizedBox(
                  height: 5,
                ),
                // signUpOption()
              ],
            ),
          ),
        ),
      )
    );
  }
}

// Row signUpOption() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const Text("Don't have account?",
//           style: TextStyle(color: Colors.white70)),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => SignUpScreen()));
//         },
//         child: const Text(
//           " Sign Up",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       )
//     ],
//   );
// }