import 'package:flutter/material.dart';

import '../reuseable/reuseable.dart';
import '../utils/colors.dart';
import 'home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("6e2945"),
            hexStringToColor("6e2945"),
            hexStringToColor("9598a3")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.email, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Strong Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Contact Number", Icons.mobile_friendly, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Address", Icons.location_on, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Easypaisa Account Number", Icons.payment, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("CNIC Number", Icons.payment_outlined, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  // FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //     email: _emailTextController.text,
                  //     password: _passwordTextController.text)
                  //     .then((value) {
                  //   print("Created New Account");
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => HomeScreen()));
                  // }).onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
