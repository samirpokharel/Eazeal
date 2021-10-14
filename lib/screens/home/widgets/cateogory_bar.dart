import 'package:eazeal/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';

class CategoryBar extends ConsumerWidget {
  final void Function(String)? onSelected;
  final String selectedCategory;
  const CategoryBar({Key? key, this.onSelected, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final categoryController = watch(categoryControllerProvider);
    if (categoryController is CategorySuccess) {
      return _buildCategory(categoryController);
    } else if (categoryController is CategoryFailed) {
      return Text(categoryController.exception.message);
    } else {
      return const SizedBox(
        height: 6,
        child: LinearProgressIndicator(),
      );
    }
  }

  SizedBox _buildCategory(CategorySuccess categoryController) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemCount: categoryController.categories.length,
        itemBuilder: (context, index) {
          final category = categoryController.categories[index];
          return Container(
            margin: const EdgeInsets.only(right: 5),
            child: ChoiceChip(
              onSelected: (bool val) {
                if (onSelected != null) {
                  return onSelected!(category.categoryName);
                }
              },
              label: Text(category.categoryName),
              selected: selectedCategory == category.categoryName,
            ),
          );
        },
      ),
    );
  }
}
