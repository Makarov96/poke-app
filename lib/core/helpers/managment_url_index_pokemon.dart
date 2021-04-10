import 'package:poke_api_app/features/pokemon/data/models/pokemon_model.dart';

mixin ManagmentUrlIndexPokemon {
  String indexFromUrl(Results results) {
    var id;
    try {
      final chunks = Uri.parse(results.url);
      id = chunks.pathSegments[chunks.pathSegments.length - 2];
      return id;
    } catch (e) {
      id = '1';
      return id;
    }
  }
}
