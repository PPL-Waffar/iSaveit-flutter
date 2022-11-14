import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/newsletter.dart';

void main() {
  testWidgets('Testing Newsletter page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: NewsView(),
    ));
    expect(find.text("Newsletter coming soon"), findsOneWidget);
  });
}
