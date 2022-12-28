// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/report/reportpage.dart';

void main() {
  testWidgets('Testing Report page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");
    String date1 = 
      DateFormat('yyyy-MM-dd').format(DateTime.now()).substring(5, 7);
    final previousReport = find.byKey(const ValueKey("previousPage"));
    final nextReport = find.byKey(const ValueKey("nextPage"));

    await tester.pumpWidget(MaterialApp(
      home: ReportView(user,date1),
    ));

    
    expect(find.text('My Balance'), findsNothing);

    await tester.pump();
    expect(find.text("This month's spending"), findsNothing);
  });
}