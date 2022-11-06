import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/profile/delete_satisfaction.dart';

void main() {
  testWidgets('Delete Satisfaction', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: DeleteFeedback(),
    ));

    expect(find.text('Delete Satisfaction Report'), findsOneWidget);
    expect(find.text('Input Transaction'), findsNothing);
    await tester.pump();

    expect(find.text('Yes'), findsOneWidget);

    expect(find.byType(Dialog), findsOneWidget);

    expect(find.descendant(of: find.byType(Dialog), matching: find.text("Delete Satisfaction Report")),findsOneWidget);
    expect(find.descendant(of: find.byType(Dialog), matching: find.text("Are you sure you want to delete a report card that is more than 4 months old?")),findsOneWidget);

    await tester.pump();
  });
}
