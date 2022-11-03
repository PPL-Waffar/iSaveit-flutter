// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/feedback/create_feedback.dart';

void main() {
  testWidgets('Create Feedback', (WidgetTester tester) async {


    final feedbackText = find.byKey(const ValueKey("feedback"));
    final createFeedbackButton = find.byKey(const ValueKey("submitFeedback"));
    final cancelFeedback = find.byKey(const ValueKey("cancelFeedback"));
    
    // Build our app and trigger a frame.
    await tester.pumpWidget( const MaterialApp(
      home: CreateFeedback(),
    ));

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.text('Edit Pocket'), findsNothing);

    await tester.pump();

    //Test textfields
    await tester.enterText(feedbackText, "I am a user and I'd like to file a complaint");
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));


    // //test buttons
    await tester.tap(createFeedbackButton);
        await tester.pump();
    await tester.tap(cancelFeedback);
  });

}
