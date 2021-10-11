import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed
abstract class User with _$User {
  const factory User({
    
  }) = _User;
}
