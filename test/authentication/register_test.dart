// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:isaveit/page/authentication/register_page.dart';

void main() {
  testWidgets('Test Register Page', (WidgetTester tester) async {
    final addName = find.byKey(const ValueKey("addName"));
    final addDate = find.byKey(const ValueKey("addDate"));
    final addEmail = find.byKey(const ValueKey("addEmail"));
    final addPassword = find.byKey(const ValueKey("addPassword"));
    final addAccount = find.byKey(const ValueKey("addAccount"));

    await tester.pumpWidget( MaterialApp(
      home: Register(),
    ));


    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('Create an account'), findsOneWidget);
    


    await tester.pump();


    expect(find.text('Welcome Back! \nYourname'), findsNothing);


    await tester.enterText(addName, "Budiman");
    await tester.enterText(addDate, "2022-10-02");
    final dateTextField = find.byIcon(Icons.calendar_today);
        await tester.tap(dateTextField);
 
    await tester.enterText(addEmail, "budiman@gmail.com");
    await tester.enterText(addPassword, "budidibudi25");
    await tester.tap(addAccount);
    await tester.pump();

    
    expect(find.text('Welcome Back! \nYourname'), findsNothing);

  });

}