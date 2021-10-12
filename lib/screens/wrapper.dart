import 'package:eazeal/config/preferences.dart';
import 'package:eazeal/screens/onbording/onbording_screen.dart';
import 'package:eazeal/screens/splash/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class Wrapper extends StatelessWidget {
  static const String routeName = "/wrapper";
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _onbordingCompleted =
        Preferences.preferences.getBool("onbordingCompleted");
    return FutureBuilder(
      future: _onbordingCompleted,
      builder: (context, data) {
        if (data.data != null && data.data == true) {
          return const SplashScreen();
        }
        return const OnbordingScreen();
      },
    );
  }
}
