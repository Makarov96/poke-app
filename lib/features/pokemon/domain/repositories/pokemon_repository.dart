import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/pokemon_model.dart';

abstract class PokemonRepostiry {
  Future<Either<Failure, List<Results>>> getPokemonFromAPI({int offset = 0});
}
