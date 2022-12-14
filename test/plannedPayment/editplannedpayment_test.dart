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
import 'package:isaveit/page/plannedpayment/editplannedpayment.dart';

void main() {
  testWidgets('Edit Your Planned Payment', (WidgetTester tester) async {
    Map<String, dynamic> thedata = {};
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");
    
    final addPaymentName = find.byKey(const ValueKey("addPaymentName"));
    final addExpense = find.byKey(const ValueKey("addExpense"));
    final transactionDate = find.byKey(const ValueKey("transactionDate"));
    final addPaymentType = find.byKey(const ValueKey("addPaymentType"));
    final addPocketName = find.byKey(const ValueKey("addPocketName"));

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Editplannedpayment(user, thedata),
    ));
    await tester.pump();

    //Test textfields
  
    await tester.enterText(addExpense, "Rp 64.000");
    await tester.pumpAndSettle();
    await tester.enterText(transactionDate, "YYYY-MM-dd");
    await tester.pumpAndSettle();
    await tester.tap(addPaymentType);
    await tester.pumpAndSettle();
   


    // //test buttons
    // await tester.tap(editPlannedPayment);
    // await tester.pump();
    // await tester.tap(deletePlannedPayment);
    // await tester.pump();
    // await tester.tap(cancelEditPocket);
    // await tester.pump();
  });
}
