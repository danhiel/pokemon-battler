import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/pokedex_view_model.dart';
import 'widgets/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GameViewModel(),
        child: MaterialApp(
          title: 'Pokemon Battler',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: App(),
        ));
  }
}
