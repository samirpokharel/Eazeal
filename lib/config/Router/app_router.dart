import 'package:eazeal/screens/screens.dart';
import 'package:eazeal/screens/splash/splash_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<CupertinoPageRoute> onGenerateRoute(RouteSettings settings) {
    debugPrint("Route:${settings.name}");
    return CupertinoPageRoute(builder: (_) {
      switch (settings.name) {
        case Wrapper.routeName:
          return const Wrapper();
        case SplashScreen.routeName:
          return const SplashScreen();
        case ForgotPassword.routeName:
          return const ForgotPassword();
        case TokenReciver.routeName:
          return TokenReciver(
            tokenReciverType: settings.arguments as TokenReciverType,
          );
        default:
          return const ErrorScreen();
      }
    });
  }
}
