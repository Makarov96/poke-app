import 'package:dartz/dartz.dart';
import 'package:poke_api_app/core/error/failure.dart';
import 'package:poke_api_app/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonRepostiry {
  Future<Either<Failure, List<Results>>> getPokemonFromAPI({int offset = 0});
}
