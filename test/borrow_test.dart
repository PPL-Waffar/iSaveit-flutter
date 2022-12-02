// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/transactions/create_borrow.dart';

void main() {
  testWidgets('Borrow Transactions 🤝🏼', (WidgetTester tester) async {
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");
    final borrowName = find.byKey(const ValueKey("borrowName"));
    final borrowAmount = find.byKey(const ValueKey("borrowAmount"));
    final borrowDate = find.byKey(const ValueKey("borrowDate"));
    final borrowType = find.byKey(const ValueKey("borrowType"));
    final borrowerName = find.byKey(const ValueKey("borrowerName"));
    // final PaymentType = find.byKey(const ValueKey("PaymentType"));
    // final PocketType = find.byKey(const ValueKey("PocketType"));
    final createInputTransactions =
        find.byKey(const ValueKey("inputTransactionButton"));
    final createCancelButton = find.byKey(const ValueKey("cancelTransaction"));

    await tester.pumpWidget(MaterialApp(
      home: CreateBorrow(user),
    ));
    await tester.pump();

    expect(find.text('Borrow Transaction'), findsOneWidget);
    expect(find.text('My Balance'), findsOneWidget);

    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text("Date"), findsOneWidget);
    expect(find.text("Amount"), findsOneWidget);
    expect(find.text("Type of Transaction"), findsOneWidget);
    expect(find.text("Type of Payment"), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds:3));

    //payment dropdown test
    final paymentItem = find.text('debit card').last;
    await tester.tap(paymentItem);
    await tester.pumpAndSettle();

    //calendar date test
    await tester.enterText(borrowDate, "2022-10-02");
    final dateTextField = find.byIcon(Icons.calendar_today);
    await tester.tap(dateTextField);
    await tester.pumpAndSettle(const Duration(seconds:3));

    //button test
    await tester.tap(createInputTransactions);
    await tester.pumpAndSettle(const Duration(seconds:3));
    await tester.tap(createCancelButton);
    await tester.pumpAndSettle(const Duration(seconds:3));
    //Create test for text fields
    // await tester.enterText(addPaymentName, "Lunch");
    // await tester.pumpAndSettle();
    // await tester.enterText(addAmount, "RP 30.000");
    // await tester.pumpAndSettle();
    // await tester.enterText(addDate, "2022-10-03");
    // await tester.pumpAndSettle();
    // await tester.tap(addBorrowingType);
    // await tester.pumpAndSettle();
    // await tester.enterText(addBorrowerName, "Jane Doe");
    // await tester.pumpAndSettle();
    // await tester.tap(addPaymentType);
    // await tester.pumpAndSettle();
    // await tester.tap(addPocketName);
    // await tester.pumpAndSettle();
    // await tester.pump(const Duration(seconds: 2));

    //Create test for the button
    // await tester.tap(createInputTransactions);
    // await tester.pumpAndSettle(const Duration(seconds:3));
    // await tester.pump();
    // await tester.tap(createCancelButton);
    // await tester.pump();
  });
}
