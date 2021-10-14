import 'package:eazeal/controller/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter/material.dart';

import 'widget/widgets.dart';

enum BottomNavItem { home, search, cart, profile }

class NavigationScreen extends ConsumerWidget {
  static const String routeName = "/navigation";
  final Map<BottomNavItem, String> _items = const {
    BottomNavItem.home: "home",
    BottomNavItem.search: "search",
    BottomNavItem.cart: "cart",
    BottomNavItem.profile: "profile",
  };

  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.home: GlobalKey<NavigatorState>(),
    BottomNavItem.search: GlobalKey<NavigatorState>(),
    BottomNavItem.cart: GlobalKey<NavigatorState>(),
    BottomNavItem.profile: GlobalKey<NavigatorState>()
  };

  NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavBarNotifier = watch(bottomNavBarProvider.notifier);
    final bottomNavBarStateNotifier = watch(bottomNavBarProvider);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: _items
              .map((item, _) {
                return MapEntry(
                  item,
                  _buildOffstageWidget(item, item == bottomNavBarStateNotifier),
                );
              })
              .values
              .toList(),
        ),
        bottomNavigationBar: BottomNavBar(
          items: _items,
          selectedItem: bottomNavBarStateNotifier,
          onTap: (int index) {
            final selectedItem = _items.keys.toList()[index];

            if (selectedItem == BottomNavItem.profile) {
              watch(userControllerProvider.notifier).getCurrentUser();
            }

            _selectBottomNavItem(
              context,
              selectedItem,
              selectedItem == bottomNavBarStateNotifier,
              bottomNavBarNotifier,
            );
          },
        ),
      ),
    );
  }

  _selectBottomNavItem(
    BuildContext context,
    BottomNavItem selectedItem,
    bool isSameItem,
    BottomNavBarController bottomNavBarNotifier,
  ) {
    if (isSameItem) {
      navigatorKeys[selectedItem]!.currentState?.popUntil(
        (route) {
          return route.isFirst;
        },
      );
    }
    bottomNavBarNotifier.updateSelctedItem(selectedItem);
  }

  Widget _buildOffstageWidget(BottomNavItem currentItem, bool isSelected) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        item: currentItem,
        navigatorKey: navigatorKeys[currentItem]!,
      ),
    );
  }
}
