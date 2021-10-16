import 'package:eazeal/config/constants.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/profile/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tabs/tabs.dart';

class ProfileScreen extends ConsumerWidget {
  int selectedPage;
  static const String routeName = "/profileScreen";
  ProfileScreen({Key? key, this.selectedPage=0}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return DefaultTabController(
      initialIndex: selectedPage,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: .5,
          title: const Text("Profile"),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: primaryColor,
            onTap: (int index) {},
            tabs: const [
              Tab(text: "dashboard"),
              Tab(text: "reviews"),
              Tab(text: "orders"),
              Tab(text: "wishlists"),
              Tab(text: "Setting"),
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
              Settings()
            ],
          ),
        ),
      ),
    );
  }
}
