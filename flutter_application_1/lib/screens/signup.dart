import 'package:flutter/material.dart';
import 'package:foodcode/screens/DisplayScreen.dart';
import 'package:foodcode/screens/SavedItem.dart';
import 'package:foodcode/widgets/buildAppBar.dart';
import 'package:foodcode/screens/HomeScreen.dart';
import 'package:foodcode/widgets/buildAppBar.dart';

class Signup extends StatefulWidget {
  Signup({@required this.title});
  static String routeName = 'SigupScreen';
  final String title;

  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  final emailTextFieldController = TextEditingController();

  final passwordTextFieldController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();

  final FocusNode emailFocusNode = FocusNode();

  bool validateEmail = true, validatePassword = true;
  final fullnameController = TextEditingController();

  final phoneController = TextEditingController();

  final FocusNode fullnameFocusNode = FocusNode();

  final FocusNode phoneFocusNode = FocusNode();

  bool validatefullname = true, validatephone = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Signup'),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Create a new account',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: fullnameFocusNode,
                controller: fullnameController,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(phoneFocusNode),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  hintText: "Full Name",
                  labelText: "Full Name",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  errorText: !validatefullname ? "Write your full name" : null,
                  prefixIcon: Icon(Icons.perm_identity, color: Colors.black),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: phoneFocusNode,
                controller: phoneController,
                onSubmitted: (value) {
                  setState(() {
                    validatefullname =
                        fullnameController.value.text.length > 10;
                    validatephone = phoneController.value.text.length == 11;
                  });
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  hintText: "Phone Number",
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  errorText: !validatephone ? "phone number is wrong!" : null,
                  prefixIcon: Icon(Icons.phone_enabled, color: Colors.black),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
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
                  "SIGN UP",
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
                    validatefullname =
                        fullnameController.value.text.length > 10;
                    validatephone = phoneController.value.text.length == 11;
                  });
                  if (validatefullname == true &&
                      validatephone == true &&
                      validateEmail == true &&
                      validatePassword == true) {
                   // Navigator.pushNamed(context, MyHomePage.routeName);
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
