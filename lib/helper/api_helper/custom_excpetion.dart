class CustomException implements Exception {
  final String? _message;
  final String _prefix;

  CustomException({String? message, required String prefix})
      : _message = message,
        _prefix = prefix;

  @override
  String toString() => "$_prefix$_message";
}

class FetchDataException extends CustomException {
  FetchDataException({String? message})
      : super(message: message, prefix: "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException({String? message})
      : super(message: message, prefix: "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException({String? message})
      : super(message: message, prefix: "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException({String? message})
      : super(message: message, prefix: "Invalid Input: ");
}
