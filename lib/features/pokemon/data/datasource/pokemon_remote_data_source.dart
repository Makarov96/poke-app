import 'package:meta/meta.dart' show required;
import 'package:http/http.dart' as http;

import 'package:poke_api_app/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<Results>> getPokemonFromAPI();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({
    @required this.client,
  });
  @override
  Future<List<Results>> getPokemonFromAPI() {
    throw UnimplementedError();
  }
}
