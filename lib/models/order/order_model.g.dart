// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      status: json['status'] as String,
      id: json['id'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderId: json['orderId'] as int,
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'products': instance.products,
      'orderId': instance.orderId,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      productName: json['productName'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      productId: json['productId'] as String,
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'price': instance.price,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'categoryName': instance.categoryName,
    };
