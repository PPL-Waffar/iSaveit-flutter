import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/navbar.dart';


void main() {
  testWidgets('Testing Navigation Bar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: SettingView(user: ,),
    ));
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
