import 'package:eazeal/config/constants.dart';
import 'package:flutter/material.dart';

class Groupbar extends StatelessWidget {
  final String title;
  final void Function()? onMore;

  const Groupbar({
    Key? key,
    required this.title,
    this.onMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headline2),
        const Spacer(),
        TextButton(
          onPressed: onMore,
          child: const Text(
            "view all",
            style: TextStyle(fontSize: 15, color: primaryColor),
          ),
        )
      ],
    );
  }
}
