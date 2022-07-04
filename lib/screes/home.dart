import 'package:flutter/material.dart';

import '../reuseable/reuseable.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List  images = [
    'assets/images/craib.png',
    'assets/images/money.gif',
  ];
  List textWidgets = <Widget>[
     Text("Text 1", style: TextStyle(
       fontSize: 30,
       color: Colors.black
     ),),
     Text("Text 2"),
  ];


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
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      images[index]
                  ),
                  fit: BoxFit.fitWidth
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 20,  right: 20),
                child: Row(
                  children: [
                    Column(
                      children:  [
                        textWidgets[index]
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: "Payment",
                backgroundColor: Colors.grey),
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
          elevation: 5),
    );
  }
}
