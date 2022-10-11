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
    
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: CreateTransaction(),
    ));
    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('My Balance'), findsOneWidget);
    expect(find.text("Payment Name"), findsOneWidget);
    expect(find.text("Date"), findsOneWidget);
    expect(find.text("Amount"), findsOneWidget);
    expect(find.text("Type of Transaction"), findsOneWidget);
    expect(find.text("Type of Payment"), findsOneWidget);
    expect(find.text("Pocket"), findsOneWidget);

    await tester.pump();

    await tester.enterText(transactionName, "Jajan kantin nasi goreng");
    await tester.pumpAndSettle();
    await tester.enterText(transactionAmount, "30.000");
    await tester.pumpAndSettle();
    await tester.enterText(transactionDate, "2022-10-02");
    await tester.pump(const Duration(seconds: 2));

        await tester.pump();
  });

}
