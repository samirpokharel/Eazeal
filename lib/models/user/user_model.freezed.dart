// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String role = "client",
      int pendingOrders = 0,
      int deliveredOrders = 0,
      int cancelledOrders = 0,
      int wishlists = 0,
      int reviews = 0,
      int numOfProductsInCart = 0,
      required String id,
      required String email,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String fullAddress}) {
    return _User(
      role: role,
      pendingOrders: pendingOrders,
      deliveredOrders: deliveredOrders,
      cancelledOrders: cancelledOrders,
      wishlists: wishlists,
      reviews: reviews,
      numOfProductsInCart: numOfProductsInCart,
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      fullAddress: fullAddress,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get role => throw _privateConstructorUsedError;
  int get pendingOrders => throw _privateConstructorUsedError;
  int get deliveredOrders => throw _privateConstructorUsedError;
  int get cancelledOrders => throw _privateConstructorUsedError;
  int get wishlists => throw _privateConstructorUsedError;
  int get reviews => throw _privateConstructorUsedError;
  int get numOfProductsInCart => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get fullAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String role,
      int pendingOrders,
      int deliveredOrders,
      int cancelledOrders,
      int wishlists,
      int reviews,
      int numOfProductsInCart,
      String id,
      String email,
      String firstName,
      String lastName,
      String phoneNumber,
      String fullAddress});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? role = freezed,
    Object? pendingOrders = freezed,
    Object? deliveredOrders = freezed,
    Object? cancelledOrders = freezed,
    Object? wishlists = freezed,
    Object? reviews = freezed,
    Object? numOfProductsInCart = freezed,
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? fullAddress = freezed,
  }) {
    return _then(_value.copyWith(
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      pendingOrders: pendingOrders == freezed
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      deliveredOrders: deliveredOrders == freezed
          ? _value.deliveredOrders
          : deliveredOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: cancelledOrders == freezed
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      wishlists: wishlists == freezed
          ? _value.wishlists
          : wishlists // ignore: cast_nullable_to_non_nullable
              as int,
      reviews: reviews == freezed
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int,
      numOfProductsInCart: numOfProductsInCart == freezed
          ? _value.numOfProductsInCart
          : numOfProductsInCart // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: fullAddress == freezed
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String role,
      int pendingOrders,
      int deliveredOrders,
      int cancelledOrders,
      int wishlists,
      int reviews,
      int numOfProductsInCart,
      String id,
      String email,
      String firstName,
      String lastName,
      String phoneNumber,
      String fullAddress});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? role = freezed,
    Object? pendingOrders = freezed,
    Object? deliveredOrders = freezed,
    Object? cancelledOrders = freezed,
    Object? wishlists = freezed,
    Object? reviews = freezed,
    Object? numOfProductsInCart = freezed,
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? fullAddress = freezed,
  }) {
    return _then(_User(
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      pendingOrders: pendingOrders == freezed
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int,
      deliveredOrders: deliveredOrders == freezed
          ? _value.deliveredOrders
          : deliveredOrders // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledOrders: cancelledOrders == freezed
          ? _value.cancelledOrders
          : cancelledOrders // ignore: cast_nullable_to_non_nullable
              as int,
      wishlists: wishlists == freezed
          ? _value.wishlists
          : wishlists // ignore: cast_nullable_to_non_nullable
              as int,
      reviews: reviews == freezed
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int,
      numOfProductsInCart: numOfProductsInCart == freezed
          ? _value.numOfProductsInCart
          : numOfProductsInCart // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: fullAddress == freezed
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {this.role = "client",
      this.pendingOrders = 0,
      this.deliveredOrders = 0,
      this.cancelledOrders = 0,
      this.wishlists = 0,
      this.reviews = 0,
      this.numOfProductsInCart = 0,
      required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.fullAddress});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @JsonKey(defaultValue: "client")
  @override
  final String role;
  @JsonKey(defaultValue: 0)
  @override
  final int pendingOrders;
  @JsonKey(defaultValue: 0)
  @override
  final int deliveredOrders;
  @JsonKey(defaultValue: 0)
  @override
  final int cancelledOrders;
  @JsonKey(defaultValue: 0)
  @override
  final int wishlists;
  @JsonKey(defaultValue: 0)
  @override
  final int reviews;
  @JsonKey(defaultValue: 0)
  @override
  final int numOfProductsInCart;
  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phoneNumber;
  @override
  final String fullAddress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(role: $role, pendingOrders: $pendingOrders, deliveredOrders: $deliveredOrders, cancelledOrders: $cancelledOrders, wishlists: $wishlists, reviews: $reviews, numOfProductsInCart: $numOfProductsInCart, id: $id, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, fullAddress: $fullAddress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('pendingOrders', pendingOrders))
      ..add(DiagnosticsProperty('deliveredOrders', deliveredOrders))
      ..add(DiagnosticsProperty('cancelledOrders', cancelledOrders))
      ..add(DiagnosticsProperty('wishlists', wishlists))
      ..add(DiagnosticsProperty('reviews', reviews))
      ..add(DiagnosticsProperty('numOfProductsInCart', numOfProductsInCart))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('fullAddress', fullAddress));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.pendingOrders, pendingOrders) ||
                const DeepCollectionEquality()
                    .equals(other.pendingOrders, pendingOrders)) &&
            (identical(other.deliveredOrders, deliveredOrders) ||
                const DeepCollectionEquality()
                    .equals(other.deliveredOrders, deliveredOrders)) &&
            (identical(other.cancelledOrders, cancelledOrders) ||
                const DeepCollectionEquality()
                    .equals(other.cancelledOrders, cancelledOrders)) &&
            (identical(other.wishlists, wishlists) ||
                const DeepCollectionEquality()
                    .equals(other.wishlists, wishlists)) &&
            (identical(other.reviews, reviews) ||
                const DeepCollectionEquality()
                    .equals(other.reviews, reviews)) &&
            (identical(other.numOfProductsInCart, numOfProductsInCart) ||
                const DeepCollectionEquality()
                    .equals(other.numOfProductsInCart, numOfProductsInCart)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.fullAddress, fullAddress) ||
                const DeepCollectionEquality()
                    .equals(other.fullAddress, fullAddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(pendingOrders) ^
      const DeepCollectionEquality().hash(deliveredOrders) ^
      const DeepCollectionEquality().hash(cancelledOrders) ^
      const DeepCollectionEquality().hash(wishlists) ^
      const DeepCollectionEquality().hash(reviews) ^
      const DeepCollectionEquality().hash(numOfProductsInCart) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(fullAddress);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {String role,
      int pendingOrders,
      int deliveredOrders,
      int cancelledOrders,
      int wishlists,
      int reviews,
      int numOfProductsInCart,
      required String id,
      required String email,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String fullAddress}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get role => throw _privateConstructorUsedError;
  @override
  int get pendingOrders => throw _privateConstructorUsedError;
  @override
  int get deliveredOrders => throw _privateConstructorUsedError;
  @override
  int get cancelledOrders => throw _privateConstructorUsedError;
  @override
  int get wishlists => throw _privateConstructorUsedError;
  @override
  int get reviews => throw _privateConstructorUsedError;
  @override
  int get numOfProductsInCart => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get fullAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
