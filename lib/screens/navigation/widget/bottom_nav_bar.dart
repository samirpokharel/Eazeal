import 'package:eazeal/config/constants.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final Map<BottomNavItem, String> items;
  final BottomNavItem selectedItem;
  final Function(int) onTap;
  const BottomNavBar({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      currentIndex: items.keys.toList().indexOf(selectedItem),
      showUnselectedLabels: false,
      items: items
          .map(
            (item, icon) => MapEntry(
              item.toString(),
              BottomNavigationBarItem(
                icon: _buildSvgIcon(
                  icon,
                  isSelected: item == selectedItem,
                ),
                label: "",
              ),
            ),
          )
          .values
          .toList(),
    );
  }

  SvgPicture _buildSvgIcon(String name, {bool isSelected = false}) {
    final String path = "assets/images/$name";
    return SvgPicture.asset(
      !isSelected ? path + "_outline.svg" : path + ".svg",
      height: 20,
      color: isSelected ? primaryColor : Colors.grey[500],
    );
  }
}
