// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:isaveit/page/feedback/delete_report.dart';
//
// void main() {
//   testWidgets('Delete Report', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MaterialApp(
//       home: DeleteFeedback(),
//     ));
//
//     expect(find.byIcon(Icons.arrow_back), findsNothing);
//     expect(find.byIcon(Icons.delete), findsOneWidget);
//     expect(find.text("Delete Feedback"), findsNothing);
//     expect(find.text('Are you sure you want to delete this satisfaction feedback?'), findsNothing);
//
//     var button = find.byKey(const ValueKey("DeleteButton"));
//     await tester.tap(button);
//     await tester.pumpAndSettle();
//     expect(find.byType(Dialog), findsOneWidget);
//
//     expect(find.descendant(of: find.byType(Dialog), matching: find.text("Delete Feedback")),findsOneWidget);
//     expect(find.descendant(of: find.byType(Dialog), matching: find.text("Are you sure you want to delete this satisfaction feedback?")),findsOneWidget);
//
//
//
//   });
// }