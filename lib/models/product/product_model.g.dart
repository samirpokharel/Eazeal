// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      imageUrl: json['imageUrl'] as List<dynamic>,
      totalRatings: json['totalRatings'] as int? ?? 0,
      noOfPeopleRated: json['noOfPeopleRated'] as int? ?? 0,
      noOfPurchases: json['noOfPurchases'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      id: json['id'] as String,
      categoryName: json['categoryName'] as String,
      productName: json['productName'] as String,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'totalRatings': instance.totalRatings,
      'noOfPeopleRated': instance.noOfPeopleRated,
      'noOfPurchases': instance.noOfPurchases,
      'price': instance.price,
      'id': instance.id,
      'categoryName': instance.categoryName,
      'productName': instance.productName,
      'productId': instance.productId,
    };
