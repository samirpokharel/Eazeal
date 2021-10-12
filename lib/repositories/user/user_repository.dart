import 'package:eazeal/models/user/user_model.dart';
import 'package:eazeal/repositories/user/base_user_respository.dart';

class UserRepository extends BaseUserRepository {
  @override
  Future<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
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
