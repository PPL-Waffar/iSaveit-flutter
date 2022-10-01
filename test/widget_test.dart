// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:isaveit/main.dart';


void main() {
  testWidgets('test widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp());

    //create test for create pocket button to go to create pocket page
    expect(find.text('Create Pocket'), findsOneWidget);
    await tester.tap(find.text('Create Pockets'));
    await tester.pumpAndSettle();

  });
}
