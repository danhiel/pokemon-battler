import 'package:app/services/pokemon_service.dart';
import 'package:app/widgets/common/loading_screen.dart';
import 'package:app/widgets/pokemon_details/pokemon_details_info.dart';
import 'package:flutter/material.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final String name;
  const PokemonDetailsScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    PokemonService service = PokemonService.instance;
    return FutureBuilder(
        future: service.getPokemonDetails(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Pokemon Detail'),
                  centerTitle: true,
                ),
                body: PokemonDetailInfoScreen(pokemon: snapshot.data!));
          } else {
            return const LoadingScreen();
          }
        });
  }
}
