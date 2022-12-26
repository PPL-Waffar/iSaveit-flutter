import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/feedback/delete_report.dart';

User user = User(
    datetime: "2021-05-01 00:00:00.000000",
    sessionId: "1234567890",
    isCitizen: true,
    email: "usertest@gmail.com",
    name: "Amanda");
int id = 5;
void main() {
  testWidgets('Delete Report', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: DeleteFeedback(user, id),
    ));

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.byIcon(Icons.delete), findsOneWidget);
    expect(find.text("Delete Feedback"), findsNothing);
    expect(
        find.text(
            'Are you sure you want to delete this satisfaction feedback?'),
        findsNothing);

    var button = find.byKey(const ValueKey("DeleteButton"));
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);

    expect(
        find.descendant(
            of: find.byType(Dialog), matching: find.text("Delete Feedback")),
        findsOneWidget);
    expect(
        find.descendant(
            of: find.byType(Dialog),
            matching: find.text(
                "Are you sure you want to delete this satisfaction feedback?")),
        findsOneWidget);
  });
}
