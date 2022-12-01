// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:isaveit/page/report/reportpage.dart';
//
// void main() {
//   testWidgets('Testing Report page', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     final previousReport = find.byKey(const ValueKey("previousPage"));
//     final nextReport = find.byKey(const ValueKey("nextPage"));
//
//     await tester.pumpWidget(const MaterialApp(
//       home: ReportView(),
//     ));
//
//     expect(find.text("My Spendings"), findsOneWidget);
//     expect(find.text('September 2022'), findsOneWidget);
//     expect(find.text('Overview'), findsOneWidget);
//     expect(find.text('My Balance'), findsNothing);
//
//     await tester.tap(previousReport);
//     await tester.tap(nextReport);
//     await tester.pump();
//     expect(find.text("This month's spending"), findsOneWidget);
//     expect(find.text('My Pocket'), findsNothing);
//   });
// }
