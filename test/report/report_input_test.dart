// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/report/report_inputdate.dart';

void main() {
  testWidgets('Report Input page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    User user = User(
        datetime: "2021-05-01 00:00:00.000000",
        sessionId: "1234567890",
        isCitizen: true,
        email: "usertest@gmail.com",
        name: "Amanda");
    final reportDate = find.byKey(const ValueKey("reportDate"));
    final submit = find.byKey(const ValueKey("submit"));

    await tester.pumpWidget(MaterialApp(
      home: ReportTime(user: user),
    ));

    expect(find.text("Please select the month you want to see the report:"),
        findsOneWidget);
    await tester.tap(reportDate);
    await tester.tap(submit);

    await tester.pump();
    expect(find.text("This month's spending"), findsNothing);

    expect(find.text("Please select the month you want to see the report:"),
        findsOneWidget);
  });
}
