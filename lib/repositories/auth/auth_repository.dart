import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/user/user_model.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/repositories/auth/base_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

      if (response.statusCode == 200) {
        return User.fromJson(response.data["user"]);
      } else if (response.statusCode == 400) {
        throw BadRequestException(message: response.data["message"]);
      } else if (response.statusCode == 401) {
        throw UnauthorisedException(message: response.data["message"]);
      } else {
        throw FetchDataException(message: "Failed to fetch data");
      }
    } catch (err) {
      throw FetchDataException(message: "Failed to fetch data");
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
    try {
      Response response = await _reader(apiClientProvider).post(
        "/auth/signup",
        data: jsonUserData,
      );

      if (response.statusCode == 200) {
        debugPrint(response.data);
      } else if (response.statusCode == 400) {
        throw BadRequestException(message: response.data["message"]);
      } else if (response.statusCode == 401) {
        throw UnauthorisedException(message: response.data["message"]);
      } else {
        throw FetchDataException(message: "Failed to fetch data");
      }
    } catch (err) {
      throw FetchDataException(message: "Failed to fetch data");
    }
  }

  @override
  Future<User> activateAccount({required String token}) async {
    try {
      Response response = await _reader(apiClientProvider).get(
        "/auth/activate-account/$token",
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data["user"]);
      } else if (response.statusCode == 400) {
        throw BadRequestException(message: response.data["message"]);
      } else if (response.statusCode == 401) {
        throw UnauthorisedException(message: response.data["message"]);
      } else {
        throw FetchDataException(message: "Failed to fetch data");
      }
    } catch (err) {
      throw FetchDataException(message: "Failed to fetch data");
    }
  }

  @override
  Future<void> forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<User> resetPassword({required String password}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
