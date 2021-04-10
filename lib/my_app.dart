import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/pokemon/presentation/screenpokedex/bloc/pokemon_bloc.dart';
import 'features/pokemon/presentation/screenpokedex/screen/screen_pokedex.dart';
import 'injection_container.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sl<PokedexBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenPokedex(),
      ),
    );
  }
}
