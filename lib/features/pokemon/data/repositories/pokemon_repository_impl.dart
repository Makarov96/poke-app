import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart' show required;

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasource/pokemon_remote_data_source.dart';
import '../models/pokemon_model.dart';

typedef _HandleGetPokemon = Future<List<Results>> Function();

class PokemonRepositoryImpl implements PokemonRepostiry {
  final PokemonRemoteDataSource pokemonRemoteDataSource;
  final NetworkInfo networkInfo;

  PokemonRepositoryImpl({
    @required this.pokemonRemoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<ServerException, List<Results>>> getPokemonFromAPI(
      {int offset = 0}) async {
    return await _handleGetPokemon(() {
      return pokemonRemoteDataSource.getPokemon(offset: offset);
    });
  }

  Future<Either<ServerException, List<Results>>> _handleGetPokemon(
    _HandleGetPokemon handleGetPokemon,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final getPokemon = await handleGetPokemon();
        return Right(getPokemon);
      } on ServerException {
        return Left(FetchDataException('Failure call to api'));
      }
    } else {
      return Left(NetworkException('Something went wrong.'));
    }
  }
}
