// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:isaveit/page/transactions/create_borrow.dart';
//
// void main() {
//   testWidgets('Borrow Transactions 🤝🏼', (WidgetTester tester) async {
//
//     final addPaymentName = find.byKey(const ValueKey("addPaymentName"));
//     final addAmount = find.byKey(const ValueKey("addAmount"));
//     final addDate = find.byKey(const ValueKey("addDate"));
//     final addBorrowerName = find.byKey(const ValueKey("addBorrowerName"));
//
//     final createInputTransactions = find.byKey(const ValueKey("createInputTransactions"));
//     final createCancelButton = find.byKey(const ValueKey("createCancelButton"));
//
//
//     await tester.pumpWidget(const MaterialApp(
//       home: CreateBorrow(),
//     ));
//     expect(find.byIcon(Icons.add), findsNothing);
//     expect(find.text('My Balance'), findsOneWidget);
//     expect(find.text("Payment Name"), findsOneWidget);
//     expect(find.text("Date"), findsOneWidget);
//     expect(find.text("Amount"), findsOneWidget);
//     expect(find.text("Type of Borrowing"), findsOneWidget);
//     expect(find.text("Borrower name"), findsOneWidget);
//     expect(find.text("Type of Payment"), findsOneWidget);
//     expect(find.text("Pocket"), findsOneWidget);
//
//
//     await tester.pump();
//
//     //Create test for text fields
//     await tester.enterText(addPaymentName, "Lunch");
//     await tester.pumpAndSettle();
//     await tester.enterText(addAmount, "RP 30.000");
//     await tester.pumpAndSettle();
//     await tester.pump(const Duration(seconds: 2));
//
//     await tester.enterText(addDate, "2022-10-03");
//     final dateTextField = find.byIcon(Icons.calendar_today);
//     await tester.tap(dateTextField);
//
//     //Borrowing Type Test
//     final addBorrowingTypeDropdown = find.byKey(const ValueKey('addBorrowingType'));
//     await tester.tap(addBorrowingTypeDropdown);
//     await tester.pumpAndSettle();
//
//     //Choose the first borrowing type
//     final addBorrowingItem = find.text('Debt').last;
//     await tester.tap(addBorrowingItem);
//     await tester.pumpAndSettle();
//
//     //Borrower name test
//     await tester.enterText(addBorrowerName, "Jane Doe");
//     await tester.pumpAndSettle();
//
//     //Payment Type Test
//     final addPaymentTypeDropdown = find.byKey(const ValueKey('addPaymentType'));
//     await tester.tap(addPaymentTypeDropdown);
//     await tester.pumpAndSettle();
//
//     //Choose the first payment type
//     final addPaymentItem = find.text('Debit').last;
//     await tester.tap(addPaymentItem);
//     await tester.pumpAndSettle();
//
//     //Pocket category test
//     final addPocketNameDropdown = find.byKey(const ValueKey('addPocketName'));
//     await tester.tap(addPocketNameDropdown);
//     await tester.pumpAndSettle();
//
//     //Choose the pocket category
//     final addPocketItem = find.text('Groceries').last;
//     await tester.tap(addPocketItem);
//     await tester.pumpAndSettle();
//
//     //Create test for the button
//     await tester.tap(createInputTransactions);
//     await tester.pump();
//     await tester.tap(createCancelButton);
//     await tester.pump();
//   });
//
// }