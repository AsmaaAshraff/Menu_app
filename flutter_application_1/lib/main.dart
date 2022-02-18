import 'package:flutter/material.dart';
import 'package:foodcode/screens/DisplayScreen.dart';
import 'package:foodcode/screens/HomeScreen.dart';
import 'package:foodcode/screens/SavedItem.dart';
import 'package:foodcode/screens/login.dart';
import 'package:foodcode/screens/signup.dart';

void main() {
  //this fun is to start our app.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //every app should have a MaterialApp widget.
    return MaterialApp(
      //the title of the app.
      title: '4HUNGERS',
      //this attr is to show or hide debug banner from  your app.
      debugShowCheckedModeBanner: false,
      //with this attr you can customize your app theme if u want.
      theme: ThemeData(
        // this attr is to customize the primary swatch of the app.
        primarySwatch: Colors.teal,
      ),
      //every material app should have a home widget which is the start of is app (eg. Splash screen).
      home: Login(title: '4HUNGERS'),
      routes: {
        DisplayScreen.routeName: (_) => DisplayScreen(
          title: 'DisplayScreen',
        ),
        HomeScreen.routeName: (_) => HomeScreen(title: 'HomeScreen'),
        Login.routeName: (_) => Login(title: 'LoginScreen'),
        Signup.routeName: (_) => Signup(title: 'SignupScreen'),
        SavedItemsScreen.routeName: (_) => SavedItemsScreen(title: 'savedScreen'),
      },
    );
  }
}

