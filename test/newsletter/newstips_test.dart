import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/newsletter/newsletter_tips.dart';

void main() {
  testWidgets('Newsletter Tips', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final allArt = find.byKey(const ValueKey("allArt"));
    final tips4u = find.byKey(const ValueKey("tips4u"));
    final newsToday = find.byKey(const ValueKey("newsToday"));
    final titleOne = find.byKey(const ValueKey("titleOne"));
    final titleTwo = find.byKey(const ValueKey("titleTwo"));

    await tester.pumpWidget(const MaterialApp(
      home: NewsletterTips(),
    ));

    expect(find.text("All articles"), findsOneWidget);
    expect(find.text('By Academia.com'), findsOneWidget);
    expect(find.text("By Detik.com"), findsOneWidget);
    expect(find.text('My Balance'), findsNothing);
    // expect(
    //     find.text(
    //         "You need this! Tips on how to save more money if you live alone and still in college."),
    //     findsOneWidget);
    await tester.tap(allArt);
    await tester.tap(tips4u);
    await tester.tap(newsToday);
    await tester.tap(titleOne);
    await tester.tap(titleTwo);
    await tester.pump();
    // expect(find.text("This month's spending"), findsOneWidget);
    // expect(find.text('My Pocket'), findsNothing);
  });
}