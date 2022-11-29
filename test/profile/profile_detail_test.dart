// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/profile/profile_detail.dart';

void main() {
  testWidgets('View Profile', (WidgetTester tester) async {
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");
    final editName = find.byKey(const ValueKey("editName"));
    final editEmail = find.byKey(const ValueKey("editEmail"));
  
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ProfileView(user),
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


   

  });

}