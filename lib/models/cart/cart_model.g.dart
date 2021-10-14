// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      imageUrl:
          (json['imageUrl'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['_id'] as String,
      price: json['price'] as int,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      productId: json['productId'] as String,
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      '_id': instance.id,
      'price': instance.price,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'categoryName': instance.categoryName,
    };
