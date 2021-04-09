import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../data/models/pokemon_model.dart';

abstract class PokemonRepostiry {
  Future<Either<ServerException, List<Results>>> getPokemonFromAPI(
      {int offset = 0});
}
