import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../models/pokemon_model.dart';

class PokemonRepositoryIml implements PokemonRepostiry {
  final PokemonRepostiry pokemonRepostiry;

  PokemonRepositoryIml(this.pokemonRepostiry);

  @override
  Future<Either<Failure, List<Results>>> getPokemonFromAPI({int offset = 0}) {
    throw UnimplementedError();
  }
}
