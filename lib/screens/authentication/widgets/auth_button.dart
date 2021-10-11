import 'package:eazeal/config/constants.dart';
import 'package:flutter/material.dart';

enum ButtonStatus { idle, busy }

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    this.onPressed,
    this.text,
    this.textStyle,
    this.color = primaryColor,
    this.buttonStatus = ButtonStatus.idle,
  })  : _isLoading = buttonStatus == ButtonStatus.busy,
        super(key: key);

  final void Function()? onPressed;
  final String? text;
  final TextStyle? textStyle;
  final ButtonStatus buttonStatus;
  final bool _isLoading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_isLoading ? 40 : 10)),
      minWidth: !_isLoading ? double.infinity : null,
      height: 55,
      onPressed: onPressed,
      child: _isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : _buildText(),
    );
  }

  Text _buildText() {
    return Text(
      text ?? "",
      style: textStyle ?? const TextStyle(color: Colors.white),
    );
  }
}
