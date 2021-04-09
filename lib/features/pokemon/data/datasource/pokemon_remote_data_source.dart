import 'dart:io';

import 'package:meta/meta.dart' show required;
import 'package:http/http.dart' as http;
import 'package:poke_api_app/core/error/exception.dart';
import 'package:poke_api_app/core/helpers/api_base.dart';
import 'package:poke_api_app/core/helpers/error_handler.dart';

import 'package:poke_api_app/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<Results>> getPokemon({int offset = 0});
}

class PokemonRemoteDataSourceImpl
    with ErrorHandler
    implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<List<Results>> getPokemon({int offset = 0}) => _getPokemonFromUrl(
        ApiBase.baseUrl + 'pokemon/?offset=$offset&limit=7',
      );

  Future<List<Results>> _getPokemonFromUrl(String url) async {
    try {
      final response = await http.get(url);
      final responseString = returnResponse(response);
      final results = PokemonResponse.fromJson(responseString).results;
      return results;
    } on ServerException {
      throw FetchDataException('No Internet connection');
    }
  }
}
