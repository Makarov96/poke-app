import 'package:equatable/equatable.dart';

class ServerException implements Exception, Equatable {
  final _message;
  final _prefix;

  ServerException([this._message, this._prefix]);
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ServerException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ServerException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ServerException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ServerException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
