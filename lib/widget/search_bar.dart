import 'package:eazeal/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class SearchBar extends StatelessWidget {
  final void Function(String)? onSearch;
  final void Function()? onTap;
  const SearchBar({
    this.onSearch,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .5,
      toolbarHeight: 90,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onTap: onTap,
                onFieldSubmitted: onSearch,
                readOnly: onTap != null ? true : false,
                autofocus: true,
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
