// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/plannedpayment/plannedpaymentdetails.dart';

void main() {
  testWidgets('Your Planned Payment Details!', (WidgetTester tester) async {

    final addPaymentName = find.byKey(const ValueKey("addPaymentName"));
    final addExpense = find.byKey(const ValueKey("addExpense"));
    final transactionDate = find.byKey(const ValueKey("transactionDate"));
    final paymentType = find.byKey(const ValueKey("paymentType"));
    final pocketType = find.byKey(const ValueKey("pocketType"));


    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Plannedpaymentdetails(),
    ));
    await tester.pump();

    //Test textfields
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text('Payment Name'), findsOneWidget);
    expect(find.text('Expense'), findsOneWidget);
    expect(find.text('Date',),findsNothing);
    expect(find.text('Type of Payment'), findsOneWidget);
    expect(find.text('Pocket'), findsOneWidget);
    await tester.enterText(addPaymentName, "Spotify");
    await tester.pumpAndSettle();
    await tester.enterText(addExpense, "Rp 64.000");
    await tester.pumpAndSettle();
    await tester.enterText(transactionDate, "2022-10-03");
    await tester.pumpAndSettle();
    await tester.enterText(paymentType, "Debit");
    await tester.pumpAndSettle();
    await tester.enterText(pocketType, "Food");
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    // //test buttons
  });
}