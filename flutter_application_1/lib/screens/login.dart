import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'signup.dart';
import '../widgets/buildAppBar.dart';

class Login extends StatefulWidget {
  Login({@required this.title});
  static String routeName = 'LoginScreen';
  final String title;

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final emailTextFieldController = TextEditingController();

  final passwordTextFieldController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();

  final FocusNode emailFocusNode = FocusNode();

  bool validateEmail = true, validatePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'FOOD CODE'),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'log into your account',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: emailFocusNode,
                controller: emailTextFieldController,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(passwordFocusNode),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  hintText: "Email",
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  errorText: !validateEmail ? "Email is wrong" : null,
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                focusNode: passwordFocusNode,
                controller: passwordTextFieldController,
                onSubmitted: (value) {
                  setState(() {
                    validateEmail =
                        emailTextFieldController.value.text.length > 10;
                    validatePassword =
                        passwordTextFieldController.value.text.length > 6;
                  });
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  hintText: "Password",
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  errorText: !validatePassword ? "password is wrong" : null,
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                  suffixIcon: Icon(Icons.visibility, color: Colors.black),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 30))),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  setState(() {
                    validateEmail =
                        emailTextFieldController.value.text.length > 10;
                    validatePassword =
                        passwordTextFieldController.value.text.length > 6;
                  });
                  if (validateEmail == true && validatePassword == true) {
                    /*Navigator.pushNamed(
                      context,
                      MyHomePage.routeName,
                    );*/
                    Navigator.pushNamed(
                      context,
                      HomeScreen.routeName,
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Deos not have an account?',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 30))),
              child: Text(
                "SIGN UP",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Signup(title: 'Signup')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GridItemChild extends StatelessWidget {
  const GridItemChild({@required this.title, @required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: Colors.black26),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
