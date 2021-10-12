import 'package:eazeal/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "/search";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      appBar: PreferredSize(
        child: SearchBar(
          showProfile: false,
          onSearch: (String term) {
            print(term);
          },
        ),
        preferredSize: const Size.fromHeight(90),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/error-vector.svg",
              width: 180,
            ),
            const SizedBox(height: 30),
            const Text("No Result Found")
          ],
        ),
      ),
    );
  }
}
