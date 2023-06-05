import 'package:app/view_models/geolocation_view_model.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    final geolocationViewModel = context.watch<GeolocationViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/detective-pikachu.jpg'),
              height: 150,
              width: 150,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: const Text(
                  'Total Captured: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: Text(
                    '${pokedexViewModel.allCapturedPokemons.length} / 151',
                    style: const TextStyle(fontSize: 20))),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: const Text(
                  'Distanced Walked:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: Text('${geolocationViewModel.totalDistance} M',
                    style: const TextStyle(fontSize: 20))),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () async {
                    await pokedexViewModel.reset();
                    if (context.mounted) {
                      context.go('/new');
                    }
                  },
                  child: const Text('Reset Pokedex')),
            )
          ],
        ),
      ),
    );
  }
}
