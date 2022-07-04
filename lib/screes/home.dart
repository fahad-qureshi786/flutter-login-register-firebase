import 'package:firebaseflutterlogin/screes/payment.dart';
import 'package:firebaseflutterlogin/screes/profile.dart';
import 'package:firebaseflutterlogin/screes/signin.dart';
import 'package:firebaseflutterlogin/screes/welcome.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_index),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.blue
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: "Payment",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.person),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                label: "Lock",
                icon: Icon(Icons.lock),
                backgroundColor: Colors.blue),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _index,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}

Widget _getBody(int index) {
  switch (index) {
    case 0:
      return homeBody(); // Create this function, it should return your first page as a widget
    case 1:
      return const PaymentScreen(); // Create this function, it should return your second page as a widget
    case 2:
      return const Profile(); // Create this function, it should return your third page as a widget
    case 3:
      return const SignInScreen(); // Create this function, it should return your fourth page as a widget
  }
  return Center(
    child: Text("There is no page builder for this index."),
  );
}
