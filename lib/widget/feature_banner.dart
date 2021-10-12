import 'package:flutter/material.dart';

class FeatureBanner extends StatelessWidget {
  final String image;
  final String title;
  final String boldText;
  // final DateTime timeRemaining;
  const FeatureBanner({
    Key? key,
    required this.image,
    required this.boldText,
    required this.title,
    // required this.timeRemaining,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Container _buildWhiteBox(String val) {
      return Container(
        height: 30,
        margin: const EdgeInsets.only(right: 10),
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          val,
          style: textTheme.subtitle2?.copyWith(
            color: const Color(0xff848484),
          ),
        ),
      );
    }

    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffEAEAEA),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title, style: textTheme.subtitle1),
                const SizedBox(height: 10),
                Text(boldText, style: textTheme.headline1),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildWhiteBox("02"),
                    _buildWhiteBox("09"),
                    _buildWhiteBox("27"),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
