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
    expect(find.byIcon(Icons.download), findsOneWidget);
    expect(find.text("Download Report"), findsNothing);
    expect(find.text("Are you sure you want to download this report?"), findsNothing);

    var button = find.byKey(const ValueKey("DownloadButton"));
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);

    expect(find.descendant(of: find.byType(Dialog), matching: find.text("Download Report")),findsOneWidget);
    expect(find.descendant(of: find.byType(Dialog), matching: find.text("Are you sure you want to download this report?")),findsOneWidget);


    // final cancelDownloadReport = find.byKey(const ValueKey("cancelDownloadReport"));
    // final confirmDownloadReport = find.byKey(const ValueKey("confirmDownloadReport"));
    //
    // await tester.tap(cancelDownloadReport);
    // await tester.pump();
    // await tester.tap(confirmDownloadReport);


  });
}