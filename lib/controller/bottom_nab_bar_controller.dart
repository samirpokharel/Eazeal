import 'package:eazeal/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBarController extends StateNotifier<BottomNavItem> {
  BottomNavBarController() : super(BottomNavItem.home);

  void updateSelctedItem(BottomNavItem item) {
    if (item != state) {
      state = item;
    }
  }
}
