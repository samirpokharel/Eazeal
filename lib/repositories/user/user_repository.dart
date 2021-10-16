import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazeal/controller/token_controller.dart';
import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/models/user/user_model.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/repositories/user/base_user_respository.dart';
import 'package:eazeal/screens/authentication/token_reciver.dart';
import 'package:eazeal/services/validation_services.dart';
import 'package:flutter/material.dart';
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
  Future<void> updateEmailRequest({required String updateEmail}) async {
    try {
      Response response = await _reader(apiClientProvider).post(
        "/user/req-update-email",
        data: {"email": updateEmail},
      );
      if (response.statusCode == 200) {
        _reader(navigationProvider).push(
          MaterialPageRoute(
            builder: (context) => TokenReciver(
              email: updateEmail,
              tokenType: TokenType.emailConformation,
            ),
          ),
        );
      }
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
  Future<User> updateEmail({
    required String token,
  }) async {
    try {
      Response response =
          await _reader(apiClientProvider).patch("/user/update-email/$token");

      print("user:${response.data}");
      User user = User.fromJson(response.data["user"]);
      if (response.statusCode == 200) {
        _reader(navigationProvider).pop();
      }
      return user;
    } on DioError catch (err) {
      if (err.type == DioErrorType.response && err.response != null) {
        throw CustomException(message: err.response!.data["message"]);
      }
      if (err.error is SocketException) {
        throw CustomException(message: "No Internet Connection");
      }
      throw CustomException(message: "Something went wrong");
    } finally {}
  }

  @override
  Future<User> updateProfile(
      {required Map<String, dynamic> requestData}) async {
    try {
      Response response = await _reader(apiClientProvider)
          .patch("/user/update-profile", data: json.encode(requestData));

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
  Future<User> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      String jsonString = json.encode({
        "password": currentPassword,
        "newPassword": newPassword,
      });
      Response response = await _reader(apiClientProvider)
          .patch("/user/update-password", data: jsonString);

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
  Future<void> deleteCurrentAccount() {
    // TODO: implement deleteCurrentAccount
    throw UnimplementedError();
  }
}
