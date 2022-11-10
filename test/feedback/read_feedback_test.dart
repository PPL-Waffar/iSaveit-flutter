import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/feedback/read_feedback.dart';

void main() {
  testWidgets('Your Satisfaction Report', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ReadFeedback(),
    ));

    final seeMoreButton = find.byKey(const ValueKey("seeMoreButton"));
    // final seeMoreButton1 = find.byKey(const ValueKey("seeMoreButton1"));
    // final seeMoreButton2 = find.byKey(const ValueKey("seeMoreButton2"));
    // final seeMoreButton3 = find.byKey(const ValueKey("seeMoreButton3"));
    // final seeMoreButton4 = find.byKey(const ValueKey("seeMoreButton4"));

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    // expect(find.byIcon(Icons.add), findsOneWidget);
    // expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
    expect(find.text("Your feedback"), findsNothing);
    expect(find.text("See your feedback"), findsNothing);
    expect(find.text("Your Satisfaction Report"), findsOneWidget);
    expect(find.text('12 June 2022'), findsOneWidget);
    expect(find.text('13 May 2022'), findsOneWidget);
    expect(find.text('15 July 2022'), findsOneWidget);
    expect(find.text('20 August 2022'), findsOneWidget);
    expect(find.text('21 June 2022'), findsOneWidget);

    await tester.tap(seeMoreButton);
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