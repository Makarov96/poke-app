import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ui/colors/custom_colors.dart';
import '../../../../../core/ui/extension/string_extension.dart';
import '../../../data/models/pokemon_model.dart';

class CustomCardPokemon extends StatelessWidget {
  const CustomCardPokemon({
    Key key,
    @required this.id,
    @required this.pokemon,
  })  : assert(id != null),
        assert(pokemon != null),
        super(key: key);
  final String id;
  final Results pokemon;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.107,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.028,
      ).copyWith(
        bottom: screenHeight * 0.02,
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              '$id',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: screenWidth * 0.05),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
                ),
                Text(
                  pokemon.name.capitalize(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: CustomColor.customredcolor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(4, 3),
          ),
        ],
      ),
    );
  }
}
