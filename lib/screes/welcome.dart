
import 'package:flutter/material.dart';

Widget homeBody(){
  List textWidgets = <Widget>[
    const Text("Text 1", style: TextStyle(
        fontSize: 30,
        color: Colors.black
    ),),
    const Text("Text 2"),
  ];
  List  images = [
    'assets/images/craib.png',
    'assets/images/money.gif',
  ];
  return PageView.builder(
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
      });
}
