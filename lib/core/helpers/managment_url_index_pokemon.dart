import 'package:poke_api_app/features/pokemon/data/models/pokemon_model.dart';

mixin ManagmentUrlIndexPokemon {
  String indexFromUrl(Results results) {
    final chunks = Uri.parse(results.url);
    var id = chunks.pathSegments[chunks.pathSegments.length - 2];
    return id;
  }
}
