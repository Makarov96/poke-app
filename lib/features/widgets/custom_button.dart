import 'package:flutter/material.dart';

import '../../core/ui/colors/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.onPressed,
  })  : assert(onPressed != null),
        super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: onPressed,
      color: CustomColor.customredcolor,
      child: Container(
        width: screenWidth * 0.6,
        child: Text(
          'Try Again now',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
