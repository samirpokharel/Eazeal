import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default("client") String role,
    @Default(0) int pendingOrders,
    @Default(0) int deliveredOrders,
    @Default(0) int cancelledOrders,
    @Default(0) int wishlists,
    @Default(0) int reviews,
    @Default(0) int numOfProductsInCart,
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String fullAddress,
  }) = _User;

  factory User.empty() => const User(
        email: "",
        firstName: "",
        fullAddress: "",
        phoneNumber: "",
        id: "",
        lastName: "",
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
