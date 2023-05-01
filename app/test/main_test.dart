import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp({}));

    await tester.pump();
    expect(find.text('Charmander'), findsOneWidget);

    await tester.tap(find.text('Select Pokemon'));
    await tester.pump();

    expect(find.text('Charmander'), findsNothing);
  });
}
