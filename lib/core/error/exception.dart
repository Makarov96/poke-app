import 'package:equatable/equatable.dart';

class ServerException implements Exception, Equatable {
  final message;
  final prefix;

  ServerException([this.message, this.prefix]);
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;

  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends ServerException {
  FetchDataException([String message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends ServerException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends ServerException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends ServerException {
  InvalidInputException([String message]) : super(message, 'Invalid Input: ');
}

class NetworkException extends ServerException {
  NetworkException([String message])
      : super(message, 'Network Failure Internet Connection');
}
