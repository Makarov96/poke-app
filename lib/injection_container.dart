import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api_app/core/network/network_info.dart';
import 'package:poke_api_app/features/pokemon/data/datasource/pokemon_remote_data_source.dart';
import 'package:poke_api_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:poke_api_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:poke_api_app/features/pokemon/domain/usecases/get_pokemon.dart';
import 'package:poke_api_app/features/pokemon/presentation/screenpokedex/bloc/pokemon_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!Features = Pokemon
  //Bloc
  sl.registerFactory(() => PokedexBloc(getPokemon: sl()));

  //Uses Cases
  sl.registerLazySingleton(() => GetPokemon(sl()));
  //Respositories
  sl.registerLazySingleton<PokemonRepostiry>(
    () => PokemonRepositoryImpl(
      networkInfo: sl(),
      pokemonRemoteDataSource: sl(),
    ),
  );
  //data sources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl()),
  );
  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
