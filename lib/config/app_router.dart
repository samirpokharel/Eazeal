import 'package:eazeal/controller/token_controller.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:eazeal/screens/splash/splash_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<CupertinoPageRoute> onGenerateRoute(RouteSettings settings) {
    
    debugPrint("Route: ${settings.name}");
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
            tokenType: settings.arguments as TokenType,
            
          );
        default:
          return const ErrorScreen();
      }
    });
  }

  static Route onGenerateNestedRoute(RouteSettings routeSettings) {
    debugPrint("Nested Route: ${routeSettings.name}");
    return CupertinoPageRoute<void>(
      settings: routeSettings,
      builder: (_) {
        switch (routeSettings.name) {
          case ProductDetail.routeName:
            return ProductDetail(
              product: routeSettings.arguments as Product,
            );
          default:
            return const ErrorScreen();
        }
      },
    );
  }
}
