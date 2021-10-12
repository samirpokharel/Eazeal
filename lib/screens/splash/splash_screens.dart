import 'package:eazeal/controller/auth_controller.dart';
import 'package:eazeal/controller/auth_controller.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/authentication/authentication.dart';
import 'package:eazeal/screens/authentication/login.dart';
import 'package:eazeal/screens/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final authController = watch(authControllerProvider);
        if (authController.status == AuthStatus.authenticated) {
          return const HomeScreen();
        } else {
          return const Authentication();
        }
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("logoout"),
          onPressed: () {
            context.read(authControllerProvider.notifier).logout();
          },
        ),
      ),
    );
  }
}
