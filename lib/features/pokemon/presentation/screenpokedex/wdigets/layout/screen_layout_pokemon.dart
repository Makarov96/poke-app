import 'package:flutter/material.dart';
import 'package:poke_api_app/core/helpers/managment_url_index_pokemon.dart';
import 'package:provider/provider.dart';

import '../../bloc/pokemon_bloc.dart';

class ScreenLayoutPokemon extends StatefulWidget with ManagmentUrlIndexPokemon {
  ScreenLayoutPokemon({Key key}) : super(key: key);

  @override
  _ScreenLayoutPokemonState createState() => _ScreenLayoutPokemonState();
}

class _ScreenLayoutPokemonState extends State<ScreenLayoutPokemon> {
  @override
  void initState() {
    context.read<PokedexBloc>().getPokemonFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokedexBloc>(
      builder: (_, model, child) {
        if (model.stateofdata == STATEOFDATA.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: model.count,
            itemBuilder: (_, i) {
              widget.indexFromUrl(model.results[i]);
              return Text('${model.results[i].url}');
            },
          );
        }
      },
    );
  }
}
