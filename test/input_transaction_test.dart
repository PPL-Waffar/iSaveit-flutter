import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/transaction/input_transaction.dart';

void main() {
  testWidgets('Test Create Transaction', (WidgetTester tester) async {
    final addPaymentName = find.byKey(const ValueKey("addPaymentName"));
    final addAmount = find.byKey(const ValueKey("addAmount"));
    final createTransaction = find.byKey(const ValueKey("createTransaction"));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Transaction(),
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


    expect(find.text('Welcome Back! \nYourname'), findsNothing);


    await tester.enterText(addPaymentName, "angel@gmail.com");
    await tester.enterText(addAmount, "ngelangel18");
    await tester.tap(createTransaction);
    await tester.pump();


  });

}