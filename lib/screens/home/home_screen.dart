import 'package:eazeal/config/constants.dart';
import 'package:eazeal/widget/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SearchBar(
          onSearch: (String term) {
            print(term);
          },
        ),
        preferredSize: const Size.fromHeight(90),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            FeatureBanner(
              image: "assets/images/feature_banner_image.png",
              boldText: "70% off",
              title: "Dashain ko dhamaka",
            )
          ],
        ),
      ),
    );
  }
}
