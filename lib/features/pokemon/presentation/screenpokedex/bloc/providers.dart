import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:poke_api_app/features/pokemon/presentation/screenpokedex/bloc/pokemon_bloc.dart';

import '../../../../../injection_container.dart';

final pokedexBloc =
    ChangeNotifierProvider<PokedexBloc>((ref) => sl<PokedexBloc>());
