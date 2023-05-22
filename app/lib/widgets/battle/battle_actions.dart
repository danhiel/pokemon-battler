import 'package:app/widgets/battle/battle_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BattleActions extends StatelessWidget {
  const BattleActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: getBattleDecorations(),
        child: Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  foregroundColor: Colors.black),
              onPressed: () => context.pop(),
              child: const Text('Flee'),
            ),
            const VerticalDivider(
              color: Colors.black,
            ),
            Flexible(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.5,
                  children: List.generate(4, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  })),
            )
          ],
        ));
  }
}
