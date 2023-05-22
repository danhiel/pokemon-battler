import 'package:flutter/material.dart';

class LoadingPikachu extends StatelessWidget {
  const LoadingPikachu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
          image: AssetImage('assets/icons/loading-pikachu.gif'),
          height: 64,
          width: 64,
          fit: BoxFit.contain),
    );
  }
}
