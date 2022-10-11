// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/transactions/create_borrow.dart';

void main() {
  testWidgets('Borrow Transactions', (WidgetTester tester) async {

    final addPaymentName = find.byKey(const ValueKey("addPaymentName"));
    final addAmount = find.byKey(const ValueKey("addAmount"));
    final addDate = find.byKey(const ValueKey("addDate"));
    final addBorrowingType = find.byKey(const ValueKey("addBorrowingType"));
    final addBorrowerName = find.byKey(const ValueKey("addBorrowerName"));
    final addPaymentType = find.byKey(const ValueKey("addPaymentType"));
    final addPocketName = find.byKey(const ValueKey("addPocketName"));
    final createInputTransactions = find.byKey(const ValueKey("createInputTransactions"));
    final createCancelButton = find.byKey(const ValueKey("createCancelButton"));


    await tester.pumpWidget(const MaterialApp(
      home: CreateBorrow(),
    ));


    await tester.pump();

    //Create test for text fields
    await tester.enterText(addPaymentName, "Lunch");
    await tester.pumpAndSettle();
    await tester.enterText(addAmount, "RP 30.000");
    await tester.pumpAndSettle();
    await tester.enterText(addDate, "2022-10-03");
    await tester.pumpAndSettle();
    await tester.enterText(addBorrowingType, "Debt");
    await tester.pumpAndSettle();
    await tester.enterText(addBorrowerName, "Jane Doe");
    await tester.pumpAndSettle();
    await tester.enterText(addPaymentType, "Debit");
    await tester.pumpAndSettle();
    await tester.enterText(addPocketName, "Food");
    await tester.pump(const Duration(seconds: 2));


    //Create test for the button
    await tester.tap(createInputTransactions);
    await tester.pump();
    await tester.tap(createCancelButton);
    await tester.pump();
  });

}