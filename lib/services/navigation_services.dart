import 'package:flutter/widgets.dart';

class NavigationServices {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }
}
