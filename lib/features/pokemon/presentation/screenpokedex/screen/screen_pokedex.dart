import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../injection_container.dart';
import '../bloc/pokemon_bloc.dart';
import '../wdigets/layout/screen_layout_pokemon.dart';

class ScreenPokedex extends StatelessWidget {
  const ScreenPokedex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<PokedexBloc>(),
      child: Scaffold(
        body: ScreenLayoutPokemon(),
      ),
    );
  }
}
