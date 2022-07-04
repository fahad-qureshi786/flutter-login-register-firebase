import 'package:firebaseflutterlogin/screes/signin.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }

  _navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 1500), (){});
    Navigator.pushReplacement( context, MaterialPageRoute(builder: (context)=> SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("Loading...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      )
    );
  }
}
