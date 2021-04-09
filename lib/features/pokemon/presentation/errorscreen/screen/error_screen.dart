import 'package:flutter/material.dart';

import '../widgets/layout/screen_error_layout.dart';

class ScreenError extends StatelessWidget {
  const ScreenError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenErrorLayout(),
    );
  }
}
