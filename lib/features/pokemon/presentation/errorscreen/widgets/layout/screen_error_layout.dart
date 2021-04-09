import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/ui/colors/custom_colors.dart';
import '../../../../../../core/ui/images/path.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../screenpokedex/bloc/pokemon_bloc.dart';

class ScreenErrorLayout extends StatefulWidget {
  const ScreenErrorLayout({Key key}) : super(key: key);

  @override
  _ScreenErrorLayoutState createState() => _ScreenErrorLayoutState();
}

class _ScreenErrorLayoutState extends State<ScreenErrorLayout> {
  @override
  void initState() {
    context.read<PokedexBloc>().getPokemonFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Stack(
        children: [
          Consumer<PokedexBloc>(
            builder: (_, model, widget) {
              return Container(
                margin: EdgeInsets.only(
                  top: screenHeight * 0.2,
                  left: screenWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.custommessage}',
                      style: TextStyle(
                        color: CustomColor.customgreycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      'please try again later...',
                      style: TextStyle(
                        color: CustomColor.customgreycolor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              onPressed: () {
                context.read<PokedexBloc>().getPokemonFromApi();
                context.read<PokedexBloc>().resetState();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: Offset(0, 20),
              child: Image.asset(
                ImagePath.pikachusad,
                width: screenHeight * 0.45,
              ),
            ),
          )
        ],
      ),
    );
  }
}
