import 'package:eazeal/controller/auth_controller.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eazeal/screens/authentication/authentication.dart';
import 'package:eazeal/screens/screens.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final authController = watch(authControllerProvider);
        if (authController.status == AuthStatus.authenticated) {
          return  NavigationScreen();
        }
        return const Authentication();
      },
    );
  }
}
