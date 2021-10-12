import 'package:eazeal/models/models.dart';

abstract class BaseUserRepository {
  Future<User> getCurrentUser();
  Future<User> updateProfile({required User user});
  Future<void> updateEmailRequest({required String updateEmail});
  Future<User> updateEmail({required String token});
  Future<void> deleteCurrentAccount();
}
