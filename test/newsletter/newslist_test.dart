import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/newsletter/newsletter_list.dart';

void main() {
  testWidgets('Newsletter List', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final allArticles = find.byKey(const ValueKey("allArticles"));
    final tipsForYou = find.byKey(const ValueKey("tipsForYou"));
    final todaysNews = find.byKey(const ValueKey("todaysNews"));
    final title1 = find.byKey(const ValueKey("title1"));
    final title2 = find.byKey(const ValueKey("title2"));

    await tester.pumpWidget(const MaterialApp(
      home: NewsletterList(),
    ));

    expect(find.text("All articles"), findsOneWidget);
    expect(find.text('By Academia.com'), findsOneWidget);
    expect(find.text("By Detik.com"), findsOneWidget);
    expect(find.text('My Balance'), findsNothing);
    expect(
        find.text(
            "You need this! Tips on how to save more money if you live alone and still in college."),
        findsOneWidget);
    expect(
        find.text(
            "Student Loans: What happens to loans when you leave college?"),
        findsOneWidget);
    await tester.tap(allArticles);
    await tester.tap(tipsForYou);
    await tester.tap(todaysNews);
    await tester.tap(title1);
    await tester.tap(title2);
    await tester.pump();
    // expect(find.text("This month's spending"), findsOneWidget);
    // expect(find.text('My Pocket'), findsNothing);
  });
}