import 'package:poke_api_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:poke_api_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:poke_api_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryIml implements PokemonRepostiry {
  @override
  Future<Either<Failure, List<Results>>> getPokemonFromAPI({int offset = 0}) {
    throw UnimplementedError();
  }
}
