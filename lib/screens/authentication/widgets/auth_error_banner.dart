import 'package:flutter/material.dart';

class AuthErrorBanner extends StatelessWidget {
  final String message;
  final void Function()? onClose;

  const AuthErrorBanner({
    Key? key,
    required this.message,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      padding: const EdgeInsets.all(10),
      leading: const Icon(Icons.error),
      backgroundColor: Colors.amberAccent,
      content: Text(message),
      actions: [
        IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close),
        )
      ],
    );
  }
}
