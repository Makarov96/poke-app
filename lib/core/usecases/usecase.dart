import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/exception.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ServerException, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}
