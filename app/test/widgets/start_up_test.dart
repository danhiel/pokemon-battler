import 'package:app/widgets/start_up/start_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StartUp', () {
    testWidgets('Should render correctly', (WidgetTester tester) async {
      final pressToStart = () {};
      await tester.pumpWidget(
          MaterialApp(home: StartUp(handlePressToStart: pressToStart)));
      expect(find.text('Pokemon Battler'), findsOneWidget);
    });

    testWidgets('Should tap on press to start button',
        (WidgetTester tester) async {
      int count = 0;
      final pressToStart = () => count++;
      await tester.pumpWidget(
          MaterialApp(home: StartUp(handlePressToStart: pressToStart)));

      await tester.tap(find.text("Press to start"));

      expect(count, 1);
    });
  });
}
