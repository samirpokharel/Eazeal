import 'package:eazeal/config/constants.dart';
import 'package:flutter/material.dart';

class AuthTogleButton extends StatelessWidget {
  const AuthTogleButton({
    Key? key,
    this.buttonTitle,
    this.actionTitle,
    this.onTap,
  }) : super(key: key);

  final String? buttonTitle;
  final String? actionTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          buttonTitle ?? "",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            actionTitle ?? "",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
