import 'package:flutter/material.dart';
import '../wdigets/layout/screen_layout_pokemon.dart';

class ScreenPokedex extends StatelessWidget {
  const ScreenPokedex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenLayoutPokemon(),
    );
  }
}
