import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/feedback/feedback_details.dart';

void main() {
  testWidgets('Feedback Details Report', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: FeedbackDetails(),
    ));

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);
    expect(
        find.text('!  This report is over 3 months old, you can delete this'),
        findsOneWidget);
    expect(find.text("Delete Satisfaction Report"), findsNothing);

    await tester.pumpAndSettle();
    expect(
        find.text('How satisfied are you with this month’s money management?'),
        findsOneWidget);
    expect(find.text('What goals do you hope to achieve next month?'),
        findsOneWidget);
    expect(find.text('What are you looking to improve in managing your money?'),
        findsOneWidget);
    expect(
        find.text('How helpful do you think this service in your daily life?'),
        findsOneWidget);
  });
}
