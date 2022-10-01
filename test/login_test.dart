// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:isaveit/page/login_page.dart';

void main() {
  testWidgets('Test Register', (WidgetTester tester) async {
    final addEmail = find.byKey(const ValueKey("addEmail"));
    final addPassword = find.byKey(const ValueKey("addPassword"));
    final loginAccount = find.byKey(const ValueKey("loginAccount"));
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Login(),
    ));


    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('Login to your account'), findsOneWidget);
    expect(find.text("Welcome back, you've been missed"), findsOneWidget);


    await tester.pump();


    expect(find.text('Welcome Back! \nYourname'), findsNothing);


    await tester.enterText(addEmail, "angel@gmail.com");
    await tester.enterText(addPassword, "ngelangel18");
    await tester.tap(loginAccount);
    await tester.pump();

    expect(find.text('Login to your account'), findsOneWidget);
    expect(find.text("Welcome back, you've been missed"), findsOneWidget);
    expect(find.text('Welcome Back! \nYourname'), findsNothing);

  });

}
