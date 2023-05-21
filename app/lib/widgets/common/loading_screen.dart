import 'package:flutter/widgets.dart';

import 'background_image.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [
      BackgroundImage(),
      Center(
        child: Image(
            image: AssetImage('assets/icons/loading-pikachu.gif'), height: 120),
      )
    ]);
  }
}
