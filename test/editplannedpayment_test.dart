// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/plannedpayment/editplannedpayment.dart';

void main() {
  testWidgets('Edit Your Planned Payment', (WidgetTester tester) async {

    final addPaymentName = find.byKey(const ValueKey("addPaymentName"));
    final addExpense = find.byKey(const ValueKey("addExpense"));
    final transactionDate = find.byKey(const ValueKey("transactionDate"));
    final addPaymentType = find.byKey(const ValueKey("addPaymentType"));
    final addPocketName = find.byKey(const ValueKey("addPocketName"));
    final editPlannedPayment = find.byKey(const ValueKey("editPlannedPayment"));
    final deletePlannedPayment = find.byKey(const ValueKey("deletePlannedPayment"));
    final cancelEditPocket = find.byKey(const ValueKey("cancelEditPocket"));

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Editplannedpayment(),
    ));
    await tester.pump();

    //Test textfields
    await tester.enterText(addPaymentName, "Spotify");
    await tester.pumpAndSettle();
    await tester.enterText(addExpense, "Rp 64.000");
    await tester.pumpAndSettle();
    await tester.enterText(transactionDate, "YYYY-MM-dd");
    await tester.pumpAndSettle();
    await tester.tap(addPaymentType);
    await tester.pumpAndSettle();
    await tester.tap(addPocketName);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    // //test buttons
    // await tester.tap(editPlannedPayment);
    // await tester.pump();
    // await tester.tap(deletePlannedPayment);
    // await tester.pump();
    // await tester.tap(cancelEditPocket);
    // await tester.pump();
  });
}