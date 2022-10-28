// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/profile/profile_detail.dart';

void main() {
  testWidgets('View Profile', (WidgetTester tester) async {

    final editName = find.byKey(const ValueKey("editName"));
    final editEmail = find.byKey(const ValueKey("editEmail"));
    final birthDate = find.byKey(const ValueKey("birthDate"));
    final editOccupation = find.byKey(const ValueKey("editOccupation"));   

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ProfileView(),
    ));

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    
    expect(find.text('Edit Pocket'), findsNothing);
    expect(find.text('Profile'), findsOneWidget);

    await tester.pump();

    //Test textfields
    await tester.enterText(editName, "audi");
    await tester.pumpAndSettle();
    await tester.enterText(editEmail, "audi@yahoo.com");
    await tester.pumpAndSettle();
    await tester.enterText(editOccupation, "Social worker");
    await tester.pump(const Duration(seconds: 2));

    await tester.enterText(birthDate, "2022-10-02");
    final dateTextField = find.byIcon(Icons.calendar_today);
        await tester.tap(dateTextField);

  });

}