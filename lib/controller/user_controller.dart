import 'package:eazeal/helper/helpers.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final User user;

  UserSuccess({required this.user});

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
}
