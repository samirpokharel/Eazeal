import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/models/user/user_model.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/repositories/user/base_user_respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository extends BaseUserRepository {
  final Reader _reader;

  UserRepository({required Reader reader}) : _reader = reader;
  @override
  Future<User> getCurrentUser() async {
    try {
      Response response = await _reader(apiClientProvider).get("/user/me");

      print("user:${response.data}");
      User user = User.fromJson(response.data["user"]);
      return user;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        throw CustomException(message: err.response!.data["message"]);
      }
      if (err.error is SocketException) {
        throw CustomException(message: "No Internet Connection");
      }
      throw CustomException(message: "Something went wrong");
    }
  }

  @override
  Future<void> updateEmailRequest({required String updateEmail}) {
    // TODO: implement updateEmailRequest
    throw UnimplementedError();
  }

  @override
  Future<User> updateEmail({required String token}) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<User> updateProfile({required User user}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCurrentAccount() {
    // TODO: implement deleteCurrentAccount
    throw UnimplementedError();
  }
}
