import 'dart:convert';

import 'package:eazeal/config/configs.dart';
import 'package:eazeal/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum WishlistStatus { initial, loading, success, failed }

class MywishListNotifier extends ChangeNotifier {
  WishlistStatus _wishlistStatus = WishlistStatus.initial;
  List<Product> _products = [];
  String _errorMessage = '';

  WishlistStatus get wishlistStatus => _wishlistStatus;
  List<Product> get products => _products;
  String get errorMessage => _errorMessage;

  void getWishlist() {
    if (_wishlistStatus == WishlistStatus.loading) return;
    try {
      List<String> products = Preferences.pref.getStringList("wishlist") ?? [];
      _products = products
          .map((productString) => Product.fromJson(json.decode(productString)))
          .toList();
      _wishlistStatus = WishlistStatus.success;
    } catch (e) {
      _wishlistStatus = WishlistStatus.failed;
      _errorMessage = "Something went wrong";
    }
  }

  void addToWishList(Product product) async {
    String productString = json.encode(product.toJson());
    if (_wishlistStatus == WishlistStatus.loading) return;
    try {
      if (isInWishlist(product)) {
        List<String> products =
            Preferences.pref.getStringList("wishlist") ?? [];

        products.removeWhere((element) => element == productString);

        await Preferences.pref.setStringList(
            "wishlist", Set<String>.from(products.toList()).toList());
      } else {
        List<String> products =
            Preferences.pref.getStringList("wishlist") ?? [];
        products.add(productString);

        await Preferences.pref.setStringList(
          "wishlist",
          Set<String>.from(products.toList()).toList(),
        );
      }
      List<String> products = Preferences.pref.getStringList("wishlist") ?? [];
      _products = products
          .map((productString) => Product.fromJson(json.decode(productString)))
          .toList();
      _wishlistStatus = WishlistStatus.success;
    } catch (e) {
      _wishlistStatus = WishlistStatus.failed;
      _errorMessage = "Something went wrong";
    }
    notifyListeners();
  }

  void removeFromWishlist(Product product) async {
    String productString = json.encode(product.toJson());
    if (_wishlistStatus == WishlistStatus.loading) return;
    try {
      List<String> products = Preferences.pref.getStringList("wishlist") ?? [];

      products.removeWhere((element) => element == productString);

      await Preferences.pref.setStringList(
        "wishlist",
        Set<String>.from(products.toList()).toList(),
      );

      products = Preferences.pref.getStringList("wishlist") ?? [];
      _products = products
          .map((productString) => Product.fromJson(json.decode(productString)))
          .toList();
      _wishlistStatus = WishlistStatus.success;
    } catch (e) {
      _wishlistStatus = WishlistStatus.failed;
      _errorMessage = "Something went wrong";
    }
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    String productString = json.encode(product.toJson());
    bool isInWishList =
        Preferences.pref.getStringList("wishlist")?.contains(productString) ??
            false;

    return isInWishList;
  }
}
