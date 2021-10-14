import 'package:eazeal/config/constants.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/profile/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tabs/tabs.dart';

class ProfileScreen extends ConsumerWidget {
  static const String routeName = "/profileScreen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: .5,
          title: const Text("Profile"),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: primaryColor,
            tabs: [
              Tab(text: "dashboard"),
              Tab(text: "reviews"),
              Tab(text: "orders"),
              Tab(text: "wishlists"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                watch(authControllerProvider.notifier).logout();
              },
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              Dashboard(),
              Orders(),
              Reviews(),
              Wishlists(),
            ],
          ),
        ),
      ),
    );
  }
}
