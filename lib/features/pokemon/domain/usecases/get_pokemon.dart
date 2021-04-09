import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

import '../../../../core/error/exception.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/pokemon_model.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemon implements UseCase<List<Results>, ParamsGetPokemon> {
  final PokemonRepostiry repostiry;

  GetPokemon(
    this.repostiry,
  );
  @override
  Future<Either<ServerException, List<Results>>> call(
      ParamsGetPokemon params) async {
    return await repostiry.getPokemonFromAPI(offset: params.offset);
  }
}

class ParamsGetPokemon extends Equatable {
  final int offset;

  ParamsGetPokemon({
    @required this.offset,
  });
  @override
  List<Object> get props => [offset];
}
