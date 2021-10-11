import 'package:eazeal/screens/authentication/login.dart';
import 'package:eazeal/screens/authentication/signup.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isLogin = true;

  void toggleScreen() {
    setState(() => isLogin = !isLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return Login(toggleScreen: toggleScreen);
    }
    return Signup(toggleScreen: toggleScreen);
  }
}
