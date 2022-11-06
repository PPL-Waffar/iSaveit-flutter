import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/profile/delete_satisfaction.dart';

void main() {
  testWidgets('Delete Report', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: DeleteReport(),
    ));

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.text('Delete Report'), findsOneWidget);
    expect(find.text("Delete Satisfaction Report"), findsNothing);
    expect(find.text("Are you sure you want to delete a report card that is more than 4 months old?"),
        findsNothing);

    
    expect(find.byType(Dialog), findsOneWidget);

    expect(
        find.descendant(
            of: find.byType(Dialog), matching: find.text("Delete Satisfaction Report")),
        findsOneWidget);
    expect(
        find.descendant(
            of: find.byType(Dialog),
            matching:
                find.text("Are you sure you want to delete a report card that is more than 4 months old?")),
        findsOneWidget);

  
  });
}
