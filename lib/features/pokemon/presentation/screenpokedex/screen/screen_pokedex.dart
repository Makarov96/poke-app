import 'package:flutter/material.dart';
import 'package:poke_api_app/features/pokemon/presentation/screenpokedex/bloc/pokedex_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/get_pokemon.dart';

class ScreenPokedex extends StatelessWidget {
  const ScreenPokedex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<PokedexBloc>(),
      child: Scaffold(
        body: ScreenLayoutPokedex(),
      ),
    );
  }
}

class ScreenLayoutPokedex extends StatefulWidget {
  ScreenLayoutPokedex({Key key}) : super(key: key);

  @override
  _ScreenLayoutPokedexState createState() => _ScreenLayoutPokedexState();
}

class _ScreenLayoutPokedexState extends State<ScreenLayoutPokedex> {
  @override
  void initState() {
    context.read<PokedexBloc>().getPokemonFromApi(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello word'),
    );
  }
}
