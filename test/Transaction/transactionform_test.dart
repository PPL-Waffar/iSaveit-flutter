// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/transactions/transaction_form.dart';

void main() {

  testWidgets('Transaction Form', (WidgetTester tester) async {
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");

    final transactionName = find.byKey(const ValueKey("addTransactionName"));
    final transactionAmount = find.byKey(const ValueKey("addTransactionAmount"));
    final transactionDate = find.byKey(const ValueKey("addTransactionDate"));
    final transactionButton = find.byKey(const ValueKey("inputTransactionButton"));
    final cancelTransaction = find.byKey(const ValueKey("cancelTransaction"));

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: CreateTransaction(user),
    ));

    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('My Balance'), findsOneWidget);
    expect(find.text("Payment Name"), findsOneWidget);
    expect(find.text("Date"), findsOneWidget);
    expect(find.text("Amount"), findsOneWidget);
    expect(find.text("Type of Transaction"), findsOneWidget);
    expect(find.text("Type of Payment"), findsOneWidget);

    await tester.pump();

    await tester.enterText(transactionName, "Jajan kantin nasi goreng");
    await tester.pumpAndSettle();
    await tester.enterText(transactionAmount, "30.000");

    await tester.pump(const Duration(seconds: 2));

    //Test calendar widget
    await tester.enterText(transactionDate, "2022-10-02");
    final dateTextField = find.byIcon(Icons.calendar_today);
    await tester.tap(dateTextField);

    //Test transaction type widget
    final transacDropdown = find.byKey(const ValueKey('transactionType'));
    await tester.tap(transacDropdown);
    await tester.pumpAndSettle();

    ///if you want to tap first item
    final transacItem = find.text('Income').last;

    await tester.tap(transacItem);
    await tester.pumpAndSettle();

    // Test payment type widget
    final paymentDropdown = find.byKey(const ValueKey('PaymentType'));
    await tester.tap(paymentDropdown);
    await tester.pumpAndSettle();

    ///if you want to tap first item
    final paymentItem = find.text('debit card').last;

    await tester.tap(paymentItem);
    await tester.pumpAndSettle();

    //Test button
    await tester.tap(transactionButton);
    await tester.pump();
    await tester.tap(cancelTransaction);

  });

}
