// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      role: json['role'] as String? ?? 'client',
      pendingOrders: json['pendingOrders'] as int? ?? 0,
      deliveredOrders: json['deliveredOrders'] as int? ?? 0,
      cancelledOrders: json['cancelledOrders'] as int? ?? 0,
      wishlists: json['wishlists'] as int? ?? 0,
      reviews: json['reviews'] as int? ?? 0,
      numOfProductsInCart: json['numOfProductsInCart'] as int? ?? 0,
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      fullAddress: json['fullAddress'] as String,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'role': instance.role,
      'pendingOrders': instance.pendingOrders,
      'deliveredOrders': instance.deliveredOrders,
      'cancelledOrders': instance.cancelledOrders,
      'wishlists': instance.wishlists,
      'reviews': instance.reviews,
      'numOfProductsInCart': instance.numOfProductsInCart,
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'fullAddress': instance.fullAddress,
      'v': instance.v,
    };
