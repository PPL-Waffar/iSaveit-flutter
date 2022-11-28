import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/newsletter/newsletter_today.dart';

void main() {
  testWidgets('Newsletter Today', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final allArticlez = find.byKey(const ValueKey("allArticlez"));
    // final tipzforU = find.byKey(const ValueKey("tipzforU"));
    // final tudeiNews = find.byKey(const ValueKey("tudeiNews"));
    // final todayTitle1 = find.byKey(const ValueKey("todayTitle1"));
    final tudeiTitle2 = find.byKey(const ValueKey("tudeiTitle2"));

    await tester.pumpWidget(const MaterialApp(
      home: NewsletterToday(),
    ));

    expect(find.text("All articles"), findsOneWidget);
    expect(find.text('By Academia.com'), findsOneWidget);
    expect(find.text("By Detik.com"), findsOneWidget);
    expect(find.text('My Balance'), findsNothing);
    // expect(
    //     find.text(
    //         "You need this! Tips on how to save more money if you live alone and still in college."),
    //     findsOneWidget);
    await tester.tap(allArticlez);
    // await tester.tap(tipzforU);
    // await tester.tap(tudeiNews);
    // await tester.tap(todayTitle1);
    await tester.tap(tudeiTitle2);
    await tester.pump();
    // expect(find.text("This month's spending"), findsOneWidget);
    // expect(find.text('My Pocket'), findsNothing);
  });
}