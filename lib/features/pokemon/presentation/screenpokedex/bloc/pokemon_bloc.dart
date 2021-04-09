import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show required;

import '../../../data/models/pokemon_model.dart';
import '../../../domain/usecases/get_pokemon.dart';

enum STATEOFDATA { loading, loaded, failure }

class PokedexBloc extends ChangeNotifier {
  final GetPokemon getPokemon;

  STATEOFDATA stateofdata = STATEOFDATA.loading;
  ScrollController _scrollController;
  ScrollController get scrollController => this._scrollController;

  PokedexBloc({
    @required GetPokemon getPokemon,
  })  : assert(getPokemon != null),
        getPokemon = getPokemon;

  List<Results> _results = [];
  List<Results> get results => this._results;

  bool _scrollSwitch;
  bool get scrollSwitch => this._scrollSwitch;
  set scrollSwitch(bool value) {
    this._scrollSwitch = value;
  }

  resetState() {
    custommessage = '';
    stateofdata = STATEOFDATA.loading;
    notifyListeners();
  }

  scrolContraollerInit() {
    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        scrollSwitch == true) {
      scrollSwitch = false;
      getPokemonFromApi();
    }
  }

  int _count = 0;
  int get count => this._count;
  set count(int counter) {
    this._count = counter;
    notifyListeners();
  }

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

  String _custommessage;
  get custommessage => this._custommessage;

  set custommessage(value) {
    this._custommessage = value;
    notifyListeners();
  }

  void getPokemonFromApi() async {
    if (_count == 1050) {
      _results = results;
      notifyListeners();
    }

    final either = await getPokemon(ParamsGetPokemon(offset: _count));
    either.fold((message) {
      print('${message.message} ${message.prefix}');
      custommessage = message.message;
      stateofdata = STATEOFDATA.failure;
    }, (list) {
      stateofdata = STATEOFDATA.loaded;
      _results.addAll(list);
      _count = results.length;
      notifyListeners();
    });
  }
}
