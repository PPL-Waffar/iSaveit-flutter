// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:isaveit/page/transactions/transaction.dart';
// import 'package:isaveit/models/user.dart';
//
// void main() {
//   testWidgets('Testing transaction dialog', (WidgetTester tester) async {
//     User user = User(
//         datetime: "2021-05-01 00:00:00.000000",
//         sessionId: "1234567890",
//         isCitizen: true,
//         email: "usertest@gmail.com",
//         name: "Amanda");
//
//
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MaterialApp(
//       home: Transaction(user),
//     ));
//
//     expect(find.text('Input'), findsOneWidget);
//     expect(find.text('Input Transaction'), findsOneWidget);
//     expect(find.byIcon(Icons.wallet_outlined), findsOneWidget);
//     await tester.pump();
//
//     expect(find.text('Borrow Transaction'), findsOneWidget);
//     expect(find.byIcon(Icons.wallet_outlined), findsOneWidget);
//     await tester.pumpWidget(
//       Directionality(
//         textDirection: TextDirection.ltr,
//         child: Material(
//           child: Center(
//             child: ElevatedButton(
//                 onPressed: () { },
//                 child: const Text('Input Transaction')
//             ),
//           ),
//         ),
//       ),
//     );
//     await tester.pumpWidget(
//       Directionality(
//         textDirection: TextDirection.ltr,
//         child: Material(
//           child: Center(
//             child: ElevatedButton(
//                 onPressed: () { },
//                 child: const Text('Borrow Transaction')
//             ),
//           ),
//         ),
//       ),
//     );
//     await tester.pumpWidget(
//       Directionality(
//         textDirection: TextDirection.ltr,
//         child: Material(
//           child: Center(
//             child: TextButton(
//                 onPressed: () {Navigator.pop; },
//                 child: const Text('Cancel')
//             ),
//           ),
//         ),
//       ),
//     );
//     await tester.pump();
//   });
// }