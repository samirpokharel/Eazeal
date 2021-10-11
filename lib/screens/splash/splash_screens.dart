import 'package:eazeal/screens/authentication/authentication.dart';
import 'package:eazeal/screens/authentication/login.dart';
import 'package:eazeal/screens/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Authentication();
  }
}
