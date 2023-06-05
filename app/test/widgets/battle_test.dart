import 'package:app/widgets/battle/battle_dialogue.dart';
import 'package:app/widgets/battle/battle_move.dart';
import 'package:app/widgets/common/loading_pikachu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:app/models/pokemon_move_model.dart';
import 'package:app/widgets/battle/battle_actions.dart';

void main() {
  group('BattleActions', () {
    final moves = [
      Move(name: 'Bite', type: 'dark', dp: 60),
      Move(name: 'Tackle', type: 'normal', dp: 60),
      Move(name: 'Water Gun', type: 'water', dp: 40),
      Move(name: 'Withdraw', type: 'water', dp: 0),
    ];
    bool isLoading = false;
    String dialogue = 'Let the battle begin';
    bool gameOver = false;

    Future playMove(String move) async {}

    testWidgets('shows LoadingPikachu when isLoading is true', (WidgetTester tester) async {
      isLoading = true;

      await tester.pumpWidget(MaterialApp(
        home: BattleActions(
          moves: moves,
          playMove: playMove,
          isLoading: isLoading,
          dialogue: dialogue,
          gameOver: gameOver,
        ),
      ));

      expect(find.byType(LoadingPikachu), findsOneWidget);
    });

    testWidgets('shows Fight and Flee buttons when isLoading is false', (WidgetTester tester) async {
      isLoading = false;

      await tester.pumpWidget(MaterialApp(
        home: BattleActions(
          moves: moves,
          playMove: playMove,
          isLoading: isLoading,
          dialogue: dialogue,
          gameOver: gameOver,
        ),
      ));

      expect(find.text('Fight'), findsOneWidget);
      expect(find.text('Flee'), findsOneWidget);
    });

    testWidgets('shows BattleDialogue when showDialogue is true', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BattleActions(
          moves: moves,
          playMove: playMove,
          isLoading: isLoading,
          dialogue: dialogue,
          gameOver: gameOver,
        ),
      ));

      expect(find.byType(BattleDialogue), findsOneWidget);
    });

    testWidgets('shows BattleMove widgets when Fight button is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BattleActions(
          moves: moves,
          playMove: playMove,
          isLoading: isLoading,
          dialogue: dialogue,
          gameOver: gameOver,
        ),
      ));

      await tester.tap(find.text('Fight'));
      await tester.pump();

      expect(find.byType(BattleMove), findsNWidgets(moves.length));
    });

    testWidgets('does not allow Fight and Flee buttons to be tapped when gameOver is true', (WidgetTester tester) async {
      gameOver = true;

      await tester.pumpWidget(MaterialApp(
        home: BattleActions(
          moves: moves,
          playMove: playMove,
          isLoading: isLoading,
          dialogue: dialogue,
          gameOver: gameOver,
        ),
      ));

      expect(tester.widget<TextButton>(find.widgetWithText(TextButton, 'Fight')).onPressed, null);
      expect(tester.widget<TextButton>(find.widgetWithText(TextButton, 'Flee')).onPressed, null);
    });
  });
}
