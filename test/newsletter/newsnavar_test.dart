import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/newsletter/newsletter_navbar.dart';


void main() {
  testWidgets('Testing Newsletter Navigation Bar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: NavbarView(),
    ));
    expect(find.byType(TabBar), findsOneWidget);
  });
}
