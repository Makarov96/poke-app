import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Failure extends Equatable {
  Failure([this.properties]);
  List properties = const <dynamic>[];

  @override
  List<Object> get props => [properties];
}

// ignore: must_be_immutable
class ServerFailure extends Failure {}
