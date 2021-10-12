import 'package:eazeal/config/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String)? onSearch;
  const SearchBar({
    this.onSearch,
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
          ],
        ),
      ),
    );
  }
}
