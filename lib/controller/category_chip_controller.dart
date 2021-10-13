import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryChipController extends StateNotifier<String> {
  CategoryChipController() : super("All");

  void onCategoryChange(String categoryName) {
    if (state != categoryName) {
      state = categoryName;
    }
  }
}
