import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:eazeal/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TokenType {
  forgotPassword,
  emailVerification,
  emailConformation,
  none,
}
enum TokenStatus { initial, loading, failed, success }

class TokenNotifier extends ChangeNotifier {
  final Reader _reader;
  TokenNotifier({required Reader reader}) : _reader = reader;

  TokenStatus _tokenStatus = TokenStatus.initial;
  String _errorMessage = "";
  TokenStatus get tokenStatus => _tokenStatus;
  String get errorMessage => _errorMessage;

  void doJob(token, TokenType tokenType) {
    if (_tokenStatus == TokenStatus.loading) return;

    try {
      _tokenStatus = TokenStatus.loading;
      if (tokenType == TokenType.emailVerification) {
        _reader(authControllerProvider.notifier).activateAccount(token);
        _tokenStatus = TokenStatus.success;
      } else if (tokenType == TokenType.emailConformation) {
        _reader(userRepositoryProvider).updateEmail(token: token);
        _tokenStatus = TokenStatus.success;
      }
    } on CustomException catch (e) {
      _tokenStatus = TokenStatus.failed;
      _errorMessage = e.message;
    }
    notifyListeners();
  }
}
