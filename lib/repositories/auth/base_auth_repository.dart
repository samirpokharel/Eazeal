import 'package:eazeal/models/models.dart';

abstract class BaseAuthRepository {
  Future<void> signUpUser({
    required String fullName,
    required String email,
    required String address,
    required String phoneNumber,
    required String password,
  });

  Future<User> activateAccount({required String token});
  Future<User> loginInWithEmailAndPassowrd({
    required String email,
    required String password,
  });
  Future<void> forgotPassword({required String email});
  Future<User> resetPassword({required String password});
 
}
