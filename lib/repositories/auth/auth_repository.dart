import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazeal/config/preferences.dart';
import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/user/user_model.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/repositories/auth/base_auth_repository.dart';
import 'package:eazeal/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AuthRepository extends BaseAuthRepository {
  final Reader _reader;

  AuthRepository({required Reader reader}) : _reader = reader;

  @override
  Future<User> loginInWithEmailAndPassowrd({
    required String email,
    required String password,
  }) async {
    try {
      String jsonUserData = json.encode({'email': email, 'password': password});
      Response response = await _reader(apiClientProvider).post(
        "/auth/login",
        data: jsonUserData,
      );

      User user = User.fromJson(response.data["user"]);
      if (response.statusCode == 200) {
        await Preferences.preferences
            .setString("token", response.data["token"]);
        await Preferences.preferences
            .setString("user", json.encode(user.toJson()));
      }
      return user;
    } on DioError catch (err) {
      throw CustomException(message: "Something went wrong");
    }
  }

  @override
  Future<void> signUpUser({
    required String fullName,
    required String email,
    required String address,
    required String phoneNumber,
    required String password,
  }) async {
    List<String> names = fullName.split(" ");
    String firstName = names[0];
    String lastName = names[1];

    String jsonUserData = json.encode({
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "fullAddress": address
    });
    print(jsonUserData);
    try {
      Response response = await _reader(apiClientProvider).post(
        "/auth/signup",
        data: jsonUserData,
      );

      if (response.statusCode == 200) {
        debugPrint(response.data);
      }
    } on DioError catch (err) {
      throw CustomException(message: "Something went wrong");
    }
  }

  @override
  Future<User> activateAccount({required String token}) async {
    try {
      Response response = await _reader(apiClientProvider).get(
        "/auth/activate-account/$token",
      );

      User user = User.fromJson(response.data["user"]);
      if (response.statusCode == 200) {
        await Preferences.preferences
            .setString("token", response.data["token"]);
        await Preferences.preferences
            .setString("user", json.encode(user.toJson()));
      }
      return user;
    } on DioError catch (err) {
      throw CustomException(message: "Something went wrong");
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      Response response = await _reader(apiClientProvider).post(
        "/auth/forgot-password",
        data: json.encode({"email": email}),
      );
      print(response.data);

      if (response.statusCode == 200) {
        debugPrint(response.data);
      }
    } on DioError catch (err) {
      throw CustomException(message: "Something went wrong");
    } finally {
      _reader(navigationProvider).pushNamed(
        TokenReciver.routeName,
        arguments: TokenReciverType.forgotPasswordConformation,
      );
    }
  }

  @override
  Future<User> resetPassword({
    required String password,
    required String token,
  }) async {
    try {
      Response response = await _reader(apiClientProvider).post(
        "/auth/reset-password/$token",
        data: json.encode({"password": password}),
      );

      User user = User.fromJson(response.data["user"]);
      if (response.statusCode == 200) {
        await Preferences.preferences
            .setString("token", response.data["token"]);
        await Preferences.preferences
            .setString("user", json.encode(user.toJson()));
      }
      return user;
    } on DioError catch (err) {
      throw CustomException(message: "Something went wrong");
    }
  }

  @override
  Stream<String?> get onUserChanges =>
      Preferences.preferences.getStringStream('token');

  @override
  Future<void> logout() async {
    await Preferences.preferences.clear();
  }
}
