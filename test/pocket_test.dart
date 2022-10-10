// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:isaveit/page/pocket/pocket_details.dart';

void main() {
  testWidgets('Pocket details', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Pocket(),
    ));

    // Verify that our counter starts at 0.
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text('Grocery Balance'), findsOneWidget);
    expect(find.text('Grocery transactions'), findsOneWidget);
    expect(find.text('Rp 500.000',),findsNothing);
    expect(find.text('Belanja September minggu kedua'), findsOneWidget);
  });
}
