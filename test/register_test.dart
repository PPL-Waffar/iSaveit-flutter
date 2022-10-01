// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:isaveit/main.dart';
import 'package:isaveit/page/homepage.dart';
import 'package:isaveit/page/register_page.dart';

void main() {
  testWidgets('Test Register', (WidgetTester tester) async {
    final addName = find.byKey(ValueKey("addName"));
    final addDate = find.byKey(ValueKey("addDate"));
    final addEmail = find.byKey(ValueKey("addEmail"));
    final addPassword = find.byKey(ValueKey("addPassword"));
    final addAccount = find.byKey(ValueKey("addAccount"));
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Register(),
    ));


    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('Create an account'), findsOneWidget);
    expect(find.text('Welcome to iSaveIt!'), findsOneWidget);


    await tester.pump();


    expect(find.text('Welcome Back! \nYourname'), findsNothing);


    await tester.enterText(addName, "Budiman");
    await tester.enterText(addDate, "25-10-2002");
    await tester.enterText(addEmail, "budiman@gmail.com");
    await tester.enterText(addPassword, "budidibudi25");
    await tester.tap(addAccount);
    await tester.pump();


  });

}
