import 'package:eazeal/config/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String)? onSearch;
  final bool showProfile;
  const SearchBar({
    this.onSearch,
    this.showProfile = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 90,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onFieldSubmitted: onSearch,
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            if (showProfile) const SizedBox(width: 10),
            if (showProfile)
              const CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor,
                child: Text("S"),
              )
          ],
        ),
      ),
    );
  }
}
