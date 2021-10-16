import 'package:eazeal/helper/api_helper/custom_excpetion.dart';
import 'package:flutter/widgets.dart';

enum SettingStatus { initial, loading, success, failed }

class SettingNotifier extends ChangeNotifier {
  SettingStatus _settingStatus = SettingStatus.initial;
  String _errorMessage = "";
  String _successMessage = "";
  SettingStatus get settingStatus => _settingStatus;

  void updateUserInfo(String fullName, String phoneNumber, String fullAddress) {
    if (_settingStatus == SettingStatus.loading) return;

    try {
      _settingStatus = SettingStatus.loading;
      
    } on CustomException catch (e) {
      _settingStatus = SettingStatus.failed;
      _errorMessage = e.message;
    }
  }
}
