import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final User user;
  final String? successMessage;

  UserSuccess({required this.user, this.successMessage});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserSuccess && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class UserFailed extends UserState {
  final CustomException customException;

  UserFailed({required this.customException});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserFailed && other.customException == customException;
  }

  @override
  int get hashCode => customException.hashCode;
}

class UserController extends StateNotifier<UserState> {
  Reader _reader;
  UserController({required Reader reader})
      : _reader = reader,
        super(UserInitial());

  void getCurrentUser() async {
    if (state is UserLoading) return;
    try {
      state = UserLoading();
      User user = await _reader(userRepositoryProvider).getCurrentUser();
      state = UserSuccess(user: user);
    } on CustomException catch (e) {
      state = UserFailed(customException: e);
    }
  }

  void updateEmail(String email) async {
    if (state is UserLoading) return;
    try {
      state = UserLoading();
      await _reader(userRepositoryProvider)
          .updateEmailRequest(updateEmail: email);
      state = UserInitial();
    } on CustomException catch (e) {
      state = UserFailed(customException: e);
    }
  }

  void setInitial() {
    state = UserInitial();
  }

  void updatePassowrd(String currentPassword, String newPassword) async {
    bool isValid = currentPassword.isEmpty && newPassword.isEmpty;
    if (state is UserLoading && isValid) return;

    try {
      state = UserLoading();
      User user = await _reader(userRepositoryProvider).updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      state = UserSuccess(
        user: user,
        successMessage: "Password update successfully",
      );
    } on CustomException catch (e) {
      state = UserFailed(customException: e);
    }
  }

  void updateProfile(
    String fullName,
    String phoneNumber,
    String address,
  ) async {
    if (state is UserLoading) return;
    try {
      Map<String, dynamic> json = {};
      // if (fullName != null) {
      //   List<String> names = fullName.split(" ");
      //   json["firstName"] = names[0];
      //   json["lastName"] = names[1];
      // }
      // if (phoneNumber != null) {
      //   json["phoneNumber"] = phoneNumber;
      // }
      // if (address != null) {
      //   json["fullAddress"] = address;
      // }
      state = UserLoading();
      User user = await _reader(userRepositoryProvider)
          .updateProfile(requestData: json);
      state = UserSuccess(
        user: user,
        successMessage: "profile updated successfully",
      );
    } on CustomException catch (e) {
      state = UserFailed(customException: e);
    }
  }
}
