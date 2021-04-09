import 'package:flutter/material.dart';
import 'package:poke_api_app/features/pokemon/data/models/pokemon_model.dart';

class CustomCardPokemon extends StatelessWidget {
  const CustomCardPokemon({
    Key key,
    @required this.id,
    @required this.pokemon,
  })  : assert(id != null),
        assert(pokemon != null),
        super(key: key);
  final String id;
  final Results pokemon;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
