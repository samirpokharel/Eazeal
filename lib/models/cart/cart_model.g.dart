// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      imageUrl:
          (json['imageUrl'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      itemQuantity: json['itemQuantity'] as int? ?? 1,
      productId: json['productId'] as String,
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'itemQuantity': instance.itemQuantity,
      'productId': instance.productId,
      'categoryName': instance.categoryName,
    };
