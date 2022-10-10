// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/transactions/transaction_form.dart';

void main() {
  testWidgets('Transaction Form', (WidgetTester tester) async {

    final transactionName = find.byKey(const ValueKey("transactionName"));
    final transactionAmount = find.byKey(const ValueKey("transactionAmount"));
    final transactionDate = find.byKey(const ValueKey("transactionDate"));
    final inputTransactionButton = find.byKey(const ValueKey("inputTransactionButton"));
    
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: InputTransaction(),
    ));


    await tester.pump();

    //Test textfields
    await tester.enterText(transactionName, "Jajan kantin nasi goreng");
    await tester.pumpAndSettle();
    await tester.enterText(transactionAmount, "30.000");
    await tester.pumpAndSettle();
    await tester.enterText(transactionDate, "12/03/22");
    await tester.pump(const Duration(seconds: 2));


    // //test buttons
    await tester.tap(inputTransactionButton);
        await tester.pump();
  });

}
