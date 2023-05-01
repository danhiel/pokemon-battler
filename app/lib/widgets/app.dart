import 'package:app/widgets/pick_starter_pokemon.dart';
import 'package:app/widgets/pokedex.dart';
import 'package:flutter/material.dart';

import 'home.dart';

const List<Widget> _widgetOptions = <Widget>[Home(), Pokedex()];

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  bool _hasStarterPokemon = false;

  _handleSelectedPokemon() {
    setState(() {
      _hasStarterPokemon = true;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !_hasStarterPokemon
            ? PickStarterPokemon(onSelectPokemon: _handleSelectedPokemon)
            : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: !_hasStarterPokemon
          ? null
          : BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Battle',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Pokedex',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
    );
  }
}
