// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {required List<dynamic> imageUrl,
      int totalRatings = 0,
      int noOfPeopleRated = 0,
      int noOfPurchases = 0,
      int price = 0,
      required String id,
      required String categoryName,
      required String productName,
      required String productId}) {
    return _Product(
      imageUrl: imageUrl,
      totalRatings: totalRatings,
      noOfPeopleRated: noOfPeopleRated,
      noOfPurchases: noOfPurchases,
      price: price,
      id: id,
      categoryName: categoryName,
      productName: productName,
      productId: productId,
    );
  }

  Product fromJson(Map<String, Object> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  List<dynamic> get imageUrl => throw _privateConstructorUsedError;
  int get totalRatings => throw _privateConstructorUsedError;
  int get noOfPeopleRated => throw _privateConstructorUsedError;
  int get noOfPurchases => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> imageUrl,
      int totalRatings,
      int noOfPeopleRated,
      int noOfPurchases,
      int price,
      String id,
      String categoryName,
      String productName,
      String productId});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? totalRatings = freezed,
    Object? noOfPeopleRated = freezed,
    Object? noOfPurchases = freezed,
    Object? price = freezed,
    Object? id = freezed,
    Object? categoryName = freezed,
    Object? productName = freezed,
    Object? productId = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalRatings: totalRatings == freezed
          ? _value.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      noOfPeopleRated: noOfPeopleRated == freezed
          ? _value.noOfPeopleRated
          : noOfPeopleRated // ignore: cast_nullable_to_non_nullable
              as int,
      noOfPurchases: noOfPurchases == freezed
          ? _value.noOfPurchases
          : noOfPurchases // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> imageUrl,
      int totalRatings,
      int noOfPeopleRated,
      int noOfPurchases,
      int price,
      String id,
      String categoryName,
      String productName,
      String productId});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? totalRatings = freezed,
    Object? noOfPeopleRated = freezed,
    Object? noOfPurchases = freezed,
    Object? price = freezed,
    Object? id = freezed,
    Object? categoryName = freezed,
    Object? productName = freezed,
    Object? productId = freezed,
  }) {
    return _then(_Product(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      totalRatings: totalRatings == freezed
          ? _value.totalRatings
          : totalRatings // ignore: cast_nullable_to_non_nullable
              as int,
      noOfPeopleRated: noOfPeopleRated == freezed
          ? _value.noOfPeopleRated
          : noOfPeopleRated // ignore: cast_nullable_to_non_nullable
              as int,
      noOfPurchases: noOfPurchases == freezed
          ? _value.noOfPurchases
          : noOfPurchases // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  const _$_Product(
      {required this.imageUrl,
      this.totalRatings = 0,
      this.noOfPeopleRated = 0,
      this.noOfPurchases = 0,
      this.price = 0,
      required this.id,
      required this.categoryName,
      required this.productName,
      required this.productId});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final List<dynamic> imageUrl;
  @JsonKey(defaultValue: 0)
  @override
  final int totalRatings;
  @JsonKey(defaultValue: 0)
  @override
  final int noOfPeopleRated;
  @JsonKey(defaultValue: 0)
  @override
  final int noOfPurchases;
  @JsonKey(defaultValue: 0)
  @override
  final int price;
  @override
  final String id;
  @override
  final String categoryName;
  @override
  final String productName;
  @override
  final String productId;

  @override
  String toString() {
    return 'Product(imageUrl: $imageUrl, totalRatings: $totalRatings, noOfPeopleRated: $noOfPeopleRated, noOfPurchases: $noOfPurchases, price: $price, id: $id, categoryName: $categoryName, productName: $productName, productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.totalRatings, totalRatings) ||
                const DeepCollectionEquality()
                    .equals(other.totalRatings, totalRatings)) &&
            (identical(other.noOfPeopleRated, noOfPeopleRated) ||
                const DeepCollectionEquality()
                    .equals(other.noOfPeopleRated, noOfPeopleRated)) &&
            (identical(other.noOfPurchases, noOfPurchases) ||
                const DeepCollectionEquality()
                    .equals(other.noOfPurchases, noOfPurchases)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(totalRatings) ^
      const DeepCollectionEquality().hash(noOfPeopleRated) ^
      const DeepCollectionEquality().hash(noOfPurchases) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(productId);

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required List<dynamic> imageUrl,
      int totalRatings,
      int noOfPeopleRated,
      int noOfPurchases,
      int price,
      required String id,
      required String categoryName,
      required String productName,
      required String productId}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  List<dynamic> get imageUrl => throw _privateConstructorUsedError;
  @override
  int get totalRatings => throw _privateConstructorUsedError;
  @override
  int get noOfPeopleRated => throw _privateConstructorUsedError;
  @override
  int get noOfPurchases => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get categoryName => throw _privateConstructorUsedError;
  @override
  String get productName => throw _privateConstructorUsedError;
  @override
  String get productId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
