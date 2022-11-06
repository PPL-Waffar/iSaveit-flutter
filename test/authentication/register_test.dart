// This is a basic Flutter widget test.

// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:isaveit/page/register_page.dart';

void main() {
  testWidgets('Test Register', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(
      home: Register(),
    ));


    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('Create an account'), findsOneWidget);
    expect(find.text('Register Error'), findsNothing);


    await tester.pump();


    expect(find.text('Welcome Back! \nYourname'), findsNothing);


    expect(find.text('Register Error'), findsNothing);
    expect(find.text('Welcome Back! \nYourname'), findsNothing);

  });

}