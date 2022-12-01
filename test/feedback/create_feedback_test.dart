// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:isaveit/page/feedback/create_feedback.dart';
//
// void main() {
//   testWidgets('Create Feedback', (WidgetTester tester) async {
//
//
//     final question1 = find.byKey(const ValueKey("question1"));
//     final question2 = find.byKey(const ValueKey("question2"));
//     final question3 = find.byKey(const ValueKey("question3"));
//     final question4 = find.byKey(const ValueKey("question4"));
//     final question5 = find.byKey(const ValueKey("question5"));
//     final createFeedbackButton = find.byKey(const ValueKey("submitFeedback"));
//     final cancelFeedback = find.byKey(const ValueKey("cancelFeedback"));
//
//     // Build our app and trigger a frame.
//     await tester.pumpWidget( const MaterialApp(
//       home: CreateFeedback(),
//     ));
//
//     expect(find.byIcon(Icons.arrow_back), findsNothing);
//     expect(find.text('Edit Pocket'), findsNothing);
//     expect(find.text("In 1-5, How satisfied are you with this month's money management?" ), findsOneWidget);
//     expect(find.text("How helpful do you think this service in your daily life?" ), findsOneWidget);
//
//     await tester.pump();
//
//     //Test textfields
//     await tester.enterText(question1, "4/5");
//     await tester.pumpAndSettle();
//     await tester.pump(const Duration(seconds: 2));
//
//     await tester.enterText(question2, "I hope to save up more money next month");
//     await tester.pumpAndSettle();
//     await tester.pump(const Duration(seconds: 2));
//
//     await tester.enterText(question3, "I will eat outside less often");
//     await tester.pumpAndSettle();
//     await tester.pump(const Duration(seconds: 2));
//
//     await tester.enterText(question4, "I think this app helps me to save money");
//     await tester.pumpAndSettle();
//     await tester.pump(const Duration(seconds: 2));
//
//     await tester.enterText(question5, "I hope they have qr scan feature");
//     await tester.pumpAndSettle();
//     await tester.pump(const Duration(seconds: 2));
//
//
//     // //test buttons
//     await tester.tap(createFeedbackButton);
//         await tester.pump();
//     await tester.tap(cancelFeedback);
//   });
//
// }