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
      body: const Center(child: Text("Home Screen")),
    );
  }
}