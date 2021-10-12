import 'dart:async';
import 'dart:convert';

import 'package:eazeal/config/preferences.dart';
import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/models/models.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

enum AuthStatus { unknown, loading, unauthenticated, authenticated, error }

class AuthState {
  final User? user;
  final CustomException? error;
  final AuthStatus status;

  const AuthState({
    this.user,
    this.error,
    this.status = AuthStatus.unknown,
  });

  factory AuthState.initial() => const AuthState();

  factory AuthState.loading() => const AuthState(status: AuthStatus.loading);

  factory AuthState.unauthenticated() {
    return const AuthState(status: AuthStatus.unauthenticated);
  }
  factory AuthState.failed({CustomException? error}) {
    return AuthState(status: AuthStatus.error, error: error);
  }

  factory AuthState.authenticated({User? user}) {
    return AuthState(status: AuthStatus.authenticated, user: user);
  }
}

class AuthController extends StateNotifier<AuthState> {
  final Reader _reader;

  StreamSubscription<String?>? _authStateChangesSubscription;

  AuthController(this._reader) : super(AuthState.initial()) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription =
        _reader(authRepositoryProvider).onUserChanges.listen((token) async {
      if (token != null) {
        String? userJson = await Preferences.preferences.getString("user") ??
            json.encode(User.empty().toJson());
        User user = User.fromJson(json.decode(userJson));

        state = AuthState.authenticated(user: user);
      } else {
        state = AuthState.unauthenticated();
      }
    });
  }
  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void login({required String email, required String password}) async {
    state = AuthState.loading();
    try {
      await _reader(authRepositoryProvider).loginInWithEmailAndPassowrd(
        email: email,
        password: password,
      );
    } on CustomException catch (e) {
      state = AuthState.failed(error: e);
    }
  }

  void closeBanner() {
    state = AuthState.initial();
  }

  void logout() async {
    await _reader(authRepositoryProvider).logout();
  }
}
