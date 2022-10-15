// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/pocket/edit_pocket.dart';

void main() {
  testWidgets('Edit Pocket', (WidgetTester tester) async {
    User user = User(
      datetime: "2021-05-01 00:00:00.000000",
      sessionId: "1234567890",
      isCitizen: true,
      email: "usertest@gmail.com",
      name: "Amanda");

    final editPocketName = find.byKey(const ValueKey("editPocketName"));
    final editPocketBudget = find.byKey(const ValueKey("editPocketBudget"));
    final editPocketButton = find.byKey(const ValueKey("editPocketButton"));
    final deletePocket= find.byKey(const ValueKey("deletePocket"));
    final cancelEditPocket = find.byKey(const ValueKey("cancelEditPocket"));
    
    // Build our app and trigger a frame.
    await tester.pumpWidget( MaterialApp(
      home: EditPocket(user),
    ));

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.text('Create Pocket'), findsNothing);
    expect(find.text('Grocery Balance'), findsOneWidget);

    await tester.pump();

    expect(find.text('Grocery Transactions'), findsNothing);

    //Test textfields
    await tester.enterText(editPocketName, "Groceries");
    await tester.pumpAndSettle();
    await tester.enterText(editPocketBudget, "300.000");
    await tester.pump(const Duration(seconds: 2));


    // //test buttons
    await tester.tap(editPocketButton);
        await tester.pump();
    await tester.tap(deletePocket);
       await tester.pump();
    await tester.tap(cancelEditPocket);

  });

}