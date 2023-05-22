import 'package:flutter/material.dart';

BoxDecoration getBattleDecorations() {
  return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.brown,
        width: 6,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.red,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(2, 0), // Shadow position
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(20)));
}
