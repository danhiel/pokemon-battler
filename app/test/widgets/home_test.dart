import 'package:app/widgets/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Home()));

      final container = find.byType(Container);
      expect(container, findsOneWidget);
    });
  });
}
