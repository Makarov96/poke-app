import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show required;

import '../../../data/models/pokemon_model.dart';
import '../../../domain/usecases/get_pokemon.dart';

enum STATEOFDATA { loadin, loaded, failure }

class PokedexBloc extends ChangeNotifier {
  final GetPokemon getPokemon;

  PokedexBloc({
    @required GetPokemon getPokemon,
  })  : assert(getPokemon != null),
        getPokemon = getPokemon;

  List<Results> _results = [];
  List<Results> get results => this._results;

  set results(List<Results> value) {
    this._results = value;
    notifyListeners();
  }

  bool _infiniteStop = false;
  get infiniteStop => this._infiniteStop;

  set infiniteStop(bool value) {
    this._infiniteStop = value;
    notifyListeners();
  }

  void getPokemonFromApi(int offset) async {
    final either = await getPokemon(ParamsGetPokemon(offset: offset));
    either.fold((message) {
      print(message);
    }, (list) {
      _results.addAll(list);
      notifyListeners();
    });
  }
}
