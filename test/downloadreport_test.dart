import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/report/downloadreport.dart';

void main() {
  testWidgets('Download Report', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: DownloadReport(),
    ));

    expect(find.byIcon(Icons.arrow_back), findsNothing);


  });
}