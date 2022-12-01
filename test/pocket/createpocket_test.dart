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
// import 'package:isaveit/models/user.dart';
// import 'package:isaveit/page/pocket/create_pocket.dart';
//
// void main() {
//   testWidgets('Create Pocket', (WidgetTester tester) async {
//     User user = User(
//         datetime: "2021-05-01 00:00:00.000000",
//         sessionId: "1234567890",
//         isCitizen: true,
//         email: "usertest@gmail.com",
//         name: "Amanda");
//
//
//     final addPocketName = find.byKey(const ValueKey("addPocketName"));
//     final addPocketBudget = find.byKey(const ValueKey("addPocketBudget"));
//     final createPocketButton = find.byKey(const ValueKey("createPocketButton"));
//     final cancelCreatePocket = find.byKey(const ValueKey("cancelCreatePocket"));
//
//     // Build our app and trigger a frame.
//     await tester.pumpWidget( MaterialApp(
//       home: CreatePocket(user),
//     ));
//
//     expect(find.byIcon(Icons.arrow_back), findsNothing);
//     expect(find.text('Edit Pocket'), findsNothing);
//
//     await tester.pump();
//
//     //Test textfields
//     await tester.enterText(addPocketName, "Groceries");
//     await tester.pumpAndSettle();
//     await tester.enterText(addPocketBudget, "300.000");
//     await tester.pump(const Duration(seconds: 2));
//
//
//     // //test buttons
//     await tester.tap(createPocketButton);
//     await tester.pump();
//     await tester.tap(cancelCreatePocket);
//   });
//
// }
