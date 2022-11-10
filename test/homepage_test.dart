import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';

import 'package:isaveit/page/homepage.dart';

void main() {
  testWidgets('Testing homepage', (WidgetTester tester) async {
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");
    // Build our app and trigger a frame.
    await tester.pumpWidget( MaterialApp(
      home: HomeView(user),
    ));


    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Welcome Back! \nYourname'), findsOneWidget);


    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();


    expect(find.text('Welcome Back! \nYourname'), findsOneWidget);

    expect(find.text('Welcome Back!'), findsNothing);
  });
}
