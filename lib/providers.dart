import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'core/network/network_info.dart';
import 'features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'features/pokemon/domain/repositories/pokemon_repository.dart';
import 'features/pokemon/domain/usecases/get_pokemon.dart';
import 'features/pokemon/presentation/screenpokedex/bloc/pokemon_bloc.dart';

//bloc
final pokedexBloc = AutoDisposeChangeNotifierProvider<PokedexBloc>(
  (ref) => PokedexBloc(
    getPokemon: ref.watch(_diUseCase),
  ),
);

//use case
final _diUseCase = Provider<GetPokemon>(
  (ref) => GetPokemon(
    ref.watch(_diRepository),
  ),
);

//repositories
final _diRepository = Provider<PokemonRepostiry>(
  (ref) => PokemonRepositoryImpl(
    pokemonRemoteDataSource: ref.watch(_diDataSource),
    networkInfo: ref.watch(_diNetworInfo),
  ),
);

//datasource
final _diDataSource = Provider<PokemonRemoteDataSource>(
  (ref) => PokemonRemoteDataSourceImpl(
    client: ref.watch(_diHttp),
  ),
);

//!core
final _diNetworInfo = Provider<NetworkInfo>(
  (ref) => NetworkInfoImpl(
    ref.watch(_diDataconection),
  ),
);

//External
final _diDataconection = Provider<DataConnectionChecker>(
  (ref) => DataConnectionChecker(),
);

final _diHttp = Provider<Client>(
  (ref) => http.Client(),
);
