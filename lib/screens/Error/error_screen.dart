import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String errorMessage =
    "We were unable to load  please try to refresh or relaunch  the app";
const String wrongMessage = "Oops! Something went wrong";

class ErrorScreen extends StatelessWidget {
  final String message;
  final String wentWrongMessage;
  const ErrorScreen(
      {Key? key,
      this.message = errorMessage,
      this.wentWrongMessage = wrongMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorWidet(
        message: message,
        wentWrongMessage: wentWrongMessage,
      ),
    );
  }
}

class ErrorWidet extends StatelessWidget {
  const ErrorWidet({
    Key? key,
    required this.message,
    required this.wentWrongMessage,
  }) : super(key: key);

  final String message;
  final String wentWrongMessage;

  @override
  Widget build(BuildContext context) {
    const String errorAssetPath = "assets/images/error-vector.svg";
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            errorAssetPath,
            width: 250,
            height: 197,
          ),
          const SizedBox(height: 30),
          Text(
            wentWrongMessage,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 300,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
