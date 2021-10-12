RegExp emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp passwordValidate = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");

class ValidationService {
  static String? validateEmail(String? val) {
    if (emailValid.hasMatch(val!)) return null;
    return "Enter a valid email";
  }

  static String? validatePassword(String? val) {
    if (passwordValidate.hasMatch(val!)) return null;
    return "Enter Strong password";
  }

  static String? confromPasswordValidate(String? firstVal, String? secondVal) {
    bool isNotNull = firstVal != null &&
        secondVal != null &&
        firstVal.length > 1 &&
        secondVal.length > 1;
    if (isNotNull && firstVal == secondVal) return null;
    return "Password Do not match";
  }

  static String? notEmptyValidation(String? val, [String? field]) {
    if (val != null && val.isNotEmpty && val.length > 1) return null;
    String message = "shuld not be empty";

    return field != null ? "$field $message" : message;
  }

  static String? phoneNumberValidation(String? val) {
    if (val != null && val.length > 7 && val.length < 12) return null;
    return "Enter a valid phonenumber";
  }
}
