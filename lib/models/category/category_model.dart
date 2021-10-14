import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String categoryName,
    required int noOfProducts,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.empty() {
    return const Category(id: "", categoryName: "", noOfProducts: 0);
  }
}
