import 'package:app/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders correctly when starter pokemon doesn\'t exist',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: App()));

      await tester.pumpAndSettle();

      expect(find.text('Select Pokemon'), findsOneWidget);
    });

    testWidgets('renders correctly when starter pokemon exist',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: App()));

      await tester.tap(find.text("Select Pokemon"));
      await tester.pumpAndSettle();

      expect(find.text('Battle'), findsOneWidget);
      expect(find.text('Pokedex'), findsOneWidget);
    });
  });
}
