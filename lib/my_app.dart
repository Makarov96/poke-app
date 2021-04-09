import 'package:flutter/material.dart';
import 'package:poke_api_app/features/pokemon/presentation/screenpokedex/screen/screen_pokedex.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenPokedex(),
    );
  }
}
