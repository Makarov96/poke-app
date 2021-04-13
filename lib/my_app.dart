import 'package:flutter/material.dart';
import 'features/pokemon/presentation/screenpokedex/screen/screen_pokedex.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenPokedex(),
    );
  }
}
