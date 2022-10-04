import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:isaveit/page/profile.dart';

void main() {
  testWidgets('Testing homepage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ProfileView(),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('Profile'), findsOneWidget);
    
    expect(find.text('Welcome Back!'), findsNothing);
  });

}