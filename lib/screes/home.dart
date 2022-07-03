import 'package:flutter/material.dart';

import '../reuseable/reuseable.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              ),
            ),
            logoWidgetHome("assets/images/craib.png"),
          ],
        )
      ),
      bottomNavigationBar:  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: "Payment",
                backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              label: "Lock",
              icon: Icon(Icons.lock),
              backgroundColor: Colors.grey,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}
