import 'package:flutter/material.dart';

class StartUp extends StatelessWidget {
  final Function handlePressToStart;

  const StartUp({super.key, required this.handlePressToStart});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/startup.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.25,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.9),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Pokemon Battler',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    const Divider(color: Colors.black),
                    ElevatedButton(
                        onPressed: () => handlePressToStart(),
                        child: const Text('Press to start'))
                  ]),
            ),
          ),
        ));
  }
}
