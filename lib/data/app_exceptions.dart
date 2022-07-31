// ignore_for_file: prefer_typing_uninitialized_variables

class AppException implements Exception {
  final _message, _prifix;
  AppException([this._message, this._prifix]);

  @override
  String toString() {
    return '$_prifix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message1])
      : super(message1, 'Error during communicaton');
}

class BadRequestException extends AppException {
  BadRequestException([String? message1]) : super(message1, 'Invalid Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message1])
      : super(message1, 'Unauthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message1]) : super(message1, 'Invalid Input');
}
