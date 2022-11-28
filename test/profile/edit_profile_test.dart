// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/profile/edit_profile.dart';

void main() {
  testWidgets('Edit Profile', (WidgetTester tester) async {
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");
    final editName = find.byKey(const ValueKey("editName"));
    final editEmail = find.byKey(const ValueKey("editEmail"));
    final saveEditProfile = find.byKey(const ValueKey("saveEditProfile"));
    final cancelEditProfile = find.byKey(const ValueKey("cancelEditProfile"));

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: EditProfile(user),
    ));

    expect(find.byIcon(Icons.arrow_back), findsNothing);
    expect(find.text('Edit Pocket'), findsNothing);
    expect(find.text('Edit your Personal Information'), findsOneWidget);

    await tester.pump();

    //Test textfields
    await tester.enterText(editName, "audi");
    await tester.pumpAndSettle();
    await tester.enterText(editEmail, "audi@yahoo.com");
    await tester.pumpAndSettle();
    // await tester.enterText(editOccupation, "Social worker");
    // await tester.pump(const Duration(seconds: 2));

    //Test calendar widget
    // await tester.enterText(transactionDate, "2022-10-02");
    // final dateTextField = find.byIcon(Icons.calendar_today);
    //     await tester.tap(dateTextField);

    // //test buttons
    await tester.tap(saveEditProfile);
    await tester.pump();
    
    await tester.tap(cancelEditProfile);
    await tester.pump();
  });

}