import 'package:app/models/pokemon_move_model.dart';
import 'package:app/widgets/battle/battle_decoration.dart';
import 'package:app/widgets/battle/battle_dialogue.dart';
import 'package:app/widgets/battle/battle_move.dart';
import 'package:app/widgets/common/loading_pikachu.dart';
import 'package:flutter/material.dart';

textButtonStyle() {
  return TextButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      foregroundColor: Colors.black);
}

class BattleActions extends StatefulWidget {
  final bool isLoading;
  final List<Move> moves;
  final Function playMove;
  final String dialogue;

  const BattleActions(
      {super.key,
      required this.moves,
      required this.playMove,
      required this.isLoading,
      required this.dialogue});

  @override
  State<BattleActions> createState() => _BattleActionsState();
}

class _BattleActionsState extends State<BattleActions> {
  bool showDialogue = true;

  handleClickMove(String move, BuildContext context) async {
    setState(() {
      showDialogue = true;
    });
    await widget.playMove(move);
  }

  handleClickFight() {
    setState(() {
      showDialogue = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: getBattleDecorations(),
        child: Row(
          children: [
            widget.isLoading
                ? const LoadingPikachu()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: textButtonStyle(),
                        onPressed: () => handleClickFight(),
                        child: const Text('Fight'),
                      ),
                      const Divider(),
                      TextButton(
                        style: textButtonStyle(),
                        onPressed: () => handleClickMove('flee', context),
                        child: const Text('Flee'),
                      ),
                    ],
                  ),
            const VerticalDivider(
              color: Colors.black,
            ),
            !showDialogue
                ? Flexible(
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 2.5,
                        children: List.generate(widget.moves.length, (index) {
                          return GestureDetector(
                              onTap: () => handleClickMove(
                                  widget.moves[index].name, context),
                              child: BattleMove(move: widget.moves[index]));
                        })),
                  )
                : BattleDialogue(dialogue: widget.dialogue)
          ],
        ));
  }
}
