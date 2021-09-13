import 'package:flutter/material.dart';
import 'package:myprofile/constants.dart';
import 'package:myprofile/screens/chat_screen.dart';
import 'package:myprofile/components/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration:
                    kTextFileDecoration.copyWith(hintText: 'Enter your email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFileDecoration.copyWith(
                    hintText: 'Enter your password')),
            SizedBox(
              height: 24.0,
            ),
            Roundedbutton(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                onpressed: () {
                  try{
                  final user = _auth.signInWithEmailAndPassword(email: email, password: password);
                  // ignore: unrelated_type_equality_checks
                  if(user != Null){
                  Navigator.pushNamed(context, ChatScreen.id);
                  } } catch(e){
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
