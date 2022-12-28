// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/feedback/read_feedback.dart';

import 'package:isaveit/models/user.dart';

User user = User(
    datetime: "2021-05-01 00:00:00.000000",
    sessionId: "1234567890",
    isCitizen: true,
    email: "usertest@gmail.com",
    name: "Amanda");
void main() {
  testWidgets('Your FeedbackReport', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ReadFeedback(user),
    ));

    final seeMoreButton = find.byKey(const ValueKey("seeMoreButton"));
    // final seeMoreButton1 = find.byKey(const ValueKey("seeMoreButton1"));
    // final seeMoreButton2 = find.byKey(const ValueKey("seeMoreButton2"));
    // final seeMoreButton3 = find.byKey(const ValueKey("seeMoreButton3"));
    // final seeMoreButton4 = find.byKey(const ValueKey("seeMoreButton4"));

    // expect(find.byIcon(Icons.add), findsOneWidget);
    // expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
    expect(find.text("Your feedback"), findsNothing);
    expect(find.text("See your feedback"), findsNothing);
    expect(find.text("Your Satisfaction Report"), findsOneWidget);
    await tester.pump();
    // await tester.tap(seeMoreButton1);
    // await tester.pump();
    // await tester.tap(seeMoreButton2);
    // await tester.pump();
    // await tester.tap(seeMoreButton3);
    // await tester.pump();
    // await tester.tap(seeMoreButton4);
    // await tester.pump();
  });
}
