import 'package:flutter/material.dart';
import 'package:poke_api_app/core/ui/colors/custom_colors.dart';
import 'package:poke_api_app/core/ui/images/path.dart';
import 'package:poke_api_app/features/widgets/custom_button.dart';

class ScreenErrorLayout extends StatelessWidget {
  const ScreenErrorLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              onPressed: () {},
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
