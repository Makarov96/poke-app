import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_card_pokemon.dart';
import '../../bloc/pokemon_bloc.dart';
import '../../../../../../core/helpers/managment_url_index_pokemon.dart';

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
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: model.count,
                  itemBuilder: (_, i) => CustomCardPokemon(
                    id: widget.indexFromUrl(model.results[i]),
                    pokemon: model.results[i],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
