import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/get_pokemon.dart';

class ScreenPokedex extends StatelessWidget {
  const ScreenPokedex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => sl<GetPokemon>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
