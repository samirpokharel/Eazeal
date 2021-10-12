import 'package:eazeal/config/constants.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:eazeal/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bootNavBarController = watch(bottomNavBarProvider.notifier);
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, name: "Mameer", onTap: () {
                bootNavBarController.updateSelctedItem(BottomNavItem.profile);
              }),
              SearchBar(
                onSearch: (String term) {},
              ),
            ],
          ),
        ),
        preferredSize: const Size.fromHeight(200),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              FeatureBanner(
                image: "assets/images/feature_banner_image.png",
                boldText: "70% off",
                title: "Dashain ko dhamaka",
              ),
              SizedBox(height: 15),
              Groupbar(title: "Category")
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildHeader(BuildContext context,
      {required String name, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Eazeal",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: primaryColor),
              ),
              const SizedBox(height: 5),
              Text(
                "buy any whare any time",
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: primaryColor,
              child: Text(name.substring(0, 1).toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
