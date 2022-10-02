// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:isaveit/page/homepage.dart';

void main() {
  testWidgets('Testing homepage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomeView(),
    ));

    // Verify that our counter starts at 0.
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Welcome Back! \nYourname'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Welcome Back! \nYourname'), findsOneWidget);

    expect(find.text('Welcome Back!'), findsNothing);
  });

}
