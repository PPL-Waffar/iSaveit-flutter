import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:isaveit/page/homepage.dart';

void main() {
  testWidgets('Testing homepage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: HomeView(),
    ));

    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Welcome Back! \nYourname'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Welcome Back! \nYourname'), findsOneWidget);

    expect(find.text('Welcome Back!'), findsNothing);
  });
}
