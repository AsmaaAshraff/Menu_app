
import 'package:flutter/material.dart';
import 'package:foodcode/screens/SavedItem.dart';

Widget buildAppBar({String title}) {
  return AppBar(
    // Here we take the value from the MyHomePage object that was created by
    // the App.build method, and use it to set our appbar title.
    backgroundColor: Colors.teal,
    title: Text(title),
    centerTitle: true,
    elevation: 5,
    actions: [
      Icon(Icons.search),
      Padding(
        padding: EdgeInsets.all(8),
        child:Icon(Icons.clean_hands_rounded),
        ),
    ],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        side: BorderSide(color: Colors.white24, width: 5)),
  );
}
