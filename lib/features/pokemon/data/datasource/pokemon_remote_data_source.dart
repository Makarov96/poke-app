import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;

import '../../../../core/error/exception.dart';
import '../../../../core/helpers/api_base.dart';
import '../../../../core/helpers/error_handler.dart';
import '../models/pokemon_model.dart';

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
      throw FetchDataException('Unexpected error');
    }
  }
}
