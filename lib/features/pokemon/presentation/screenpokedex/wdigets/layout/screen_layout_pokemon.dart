import 'package:flutter/material.dart';
import 'package:poke_api_app/features/pokemon/presentation/errorscreen/screen/error_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/helpers/managment_url_index_pokemon.dart';
import '../../../../../widgets/custom_loading_pikachu.dart';
import '../../bloc/pokemon_bloc.dart';
import '../custom_card_pokemon.dart';

class ScreenLayoutPokemon extends StatefulWidget with ManagmentUrlIndexPokemon {
  ScreenLayoutPokemon({Key key}) : super(key: key);
  @override
  _ScreenLayoutPokemonState createState() => _ScreenLayoutPokemonState();
}

class _ScreenLayoutPokemonState extends State<ScreenLayoutPokemon> {
  @override
  void initState() {
    context.read<PokedexBloc>().stateofdata.addListener(_addListener);
    context.read<PokedexBloc>().getPokemonFromApi();
    context.read<PokedexBloc>().scrolContraollerInit();
    super.initState();
  }

  _addListener() {
    if (context.read<PokedexBloc>().stateofdata.value == STATEOFDATA.failure) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => ScreenError(),
        ),
      );
    }
  }

  @override
  void dispose() {
    context.read<PokedexBloc>().stateofdata.removeListener(_addListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<PokedexBloc>(
      builder: (_, model, child) {
        if (model.stateofdata.value == STATEOFDATA.loading) {
          return Center(
            child: CustomLoadingPikachu(
              height: screenHeight * 0.3,
              width: screenWidth * 0.5,
            ),
          );
        } else {
          return Stack(
            children: [
              ListView.builder(
                controller: model.scrollController,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.1,
                  bottom: screenHeight * 0.1,
                ),
                itemCount: model.results.length,
                itemBuilder: (_, i) => CustomCardPokemon(
                  id: widget.indexFromUrl(model.results[i]),
                  pokemon: model.results[i],
                ),
              ),
              model.scrollSwitch
                  ? Container()
                  : Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: CustomLoadingPikachu(
                        height: 50,
                        width: 50,
                      ),
                    ),
            ],
          );
        }
      },
    );
  }
}
