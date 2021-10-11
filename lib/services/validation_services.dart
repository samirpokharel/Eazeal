RegExp emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp passwordValidate = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");

class ValidationService {
  static String? validateEmail(String? val) {
    if (!emailValid.hasMatch(val!)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? val) {
    if (!passwordValidate.hasMatch(val!)) {
      return "Enter string password";
    }
    return null;
  }
}
