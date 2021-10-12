import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String errorAssetPath = "assets/images/error-vector.svg";
    const String errorMessage =
        "We were unable to load this page please try to relaunch the app";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              errorAssetPath,
              width: 268,
              height: 197,
            ),
            const SizedBox(height: 30),
            const Text(
              "Oops! Something went wrong",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const SizedBox(
              width: 300,
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
