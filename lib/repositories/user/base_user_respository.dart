import 'package:eazeal/models/models.dart';

abstract class BaseUserRepository {
  Future<User> getCurrentUser();
  Future<User> updateProfile({required Map<String, dynamic> requestData});
  Future<void> updateEmailRequest({required String updateEmail});
  Future<User> updateEmail({required String token});
  Future<void> deleteCurrentAccount();
  Future<User> updatePassword({
    required String currentPassword,
    required String newPassword,
  });
}
