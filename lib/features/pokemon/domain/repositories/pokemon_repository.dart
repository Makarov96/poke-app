import 'package:dartz/dartz.dart';
import 'package:poke_api_app/core/error/exception.dart';

import '../../data/models/pokemon_model.dart';

abstract class PokemonRepostiry {
  Future<Either<ServerException, List<Results>>> getPokemonFromAPI(
      {int offset = 0});
}
