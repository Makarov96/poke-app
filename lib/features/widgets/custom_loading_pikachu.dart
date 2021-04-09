import 'package:flutter/material.dart';

import '../../core/ui/images/path.dart';

class CustomLoadingPikachu extends StatelessWidget {
  const CustomLoadingPikachu({
    Key key,
    @required this.height,
    @required this.width,
  })  : assert(height != null),
        assert(width != null),
        super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.pikachuGig),
                ),
              ),
            ),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
