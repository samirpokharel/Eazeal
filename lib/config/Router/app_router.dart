import 'package:eazeal/screens/splash/splash_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppRouter {
  static Route<CupertinoPageRoute> onGenerateRoute(RouteSettings settings) {
    debugPrint("Route:${settings.name}");
    return CupertinoPageRoute(builder: (_) {
      switch (settings.name) {
        case SplashScreen.routeName:
          return SplashScreen();
        default:
          return _error();
      }
    });
  }

  static Scaffold _error() {
    const String errorAssetPath = "assets/images/error-vector.svg";
    const String errorMessage = "We were unable to load this page";
    return Scaffold(
      appBar: AppBar(title: const Text("Something Went wrong!")),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              errorAssetPath,
              width: 268,
              height: 197,
            ),
            const SizedBox(height: 20),
            const Text(
              errorMessage,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
