import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/newsletter/newsletter_details.dart';

void main() {
  testWidgets('Testing Newsletter Details', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: NewsDetails(),
    ));
    expect(find.text("Newsletter"), findsNothing);
    expect(find.text('Tips for you'), findsOneWidget);
    expect(
        find.text(
            "You need this! Tips on how to save more money if you live alone and still in college."),
        findsOneWidget);
    await tester.pump();
    await tester.tap(find.byIcon(Icons.arrow_back));

    expect(find.text("By Detik.com"), findsOneWidget);

    expect(find.text('Kompas.com'), findsNothing);
  });
}