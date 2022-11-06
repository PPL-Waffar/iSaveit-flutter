import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/profile/feedback.dart';

void main() {
  testWidgets('Satisfaction Report', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget( const MaterialApp(
      home: FeedbackPage(),
    ));

    
    expect(find.text('Delete Satisfaction Report'), findsNothing);
    expect(find.text('Feedback Report'), findsOneWidget);
    await tester.pump();

    expect(find.text('John Doe'), findsOneWidget);

    expect(find.text('Delete Feedback'), findsOneWidget);
    await tester.pump();
  });
}
