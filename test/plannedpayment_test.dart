// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/plannedpayment/plannedpayment.dart';

void main() {
  testWidgets('Create Planned Payment', (WidgetTester tester) async {

    final addPaymentName = find.byKey(const ValueKey("addPaymentName"));
    final addExpense = find.byKey(const ValueKey("addExpense"));
    final createSubmitButton = find.byKey(const ValueKey("createSubmitButton"));
    final createCancelButton = find.byKey(const ValueKey("createCancelButton"));

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Plannedpayment(),
    ));



    await tester.pump();

    //Test textfields
    await tester.enterText(addPaymentName, "Spotify");
    await tester.pumpAndSettle();
    await tester.enterText(addExpense, "Rp 24.000");
    await tester.pump(const Duration(seconds: 2));


    // //test buttons
    await tester.tap(createSubmitButton);
    await tester.pump();
    await tester.tap(createCancelButton);
  });

}