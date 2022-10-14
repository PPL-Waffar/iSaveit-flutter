
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/transaction/transaction.dart';

void main() {
  testWidgets('Testing transaction dialog', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Transaction(),
    ));

    expect(find.text('Input'), findsOneWidget);
    expect(find.text('Input Transaction'), findsOneWidget);
    expect(find.byIcon(Icons.wallet_outlined), findsOneWidget);
    await tester.pump();

    expect(find.text('Borrow Transaction'), findsOneWidget);
    expect(find.byIcon(Icons.wallet_outlined), findsOneWidget);
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: ElevatedButton(
              onPressed: () { },
              child: const Text('Input Transaction')
            ),
          ),
        ),
      ),
    );
    await tester.pump();
  });
}
