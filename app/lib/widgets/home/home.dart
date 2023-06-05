import 'package:app/widgets/battle/battle_home.dart';
import 'package:app/widgets/pokedex/pokedex.dart';
import 'package:app/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

const List<Widget> _widgetOptions = <Widget>[
  StartBattle(),
  Pokedex(),
  Profile()
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Battle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Pokedex',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
