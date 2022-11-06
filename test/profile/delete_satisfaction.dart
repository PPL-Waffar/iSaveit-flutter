import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isaveit/page/profile/delete_satisfaction.dart';

void main() {
  testWidgets('Delete Satisfaction', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: DeleteFeedback(),
    ));

    expect(find.text('Delete Satisfaction Report'), findsOneWidget);
    expect(find.text('Input Transaction'), findsNothing);
    await tester.pump();

    expect(find.text('Yes'), findsOneWidget);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: ElevatedButton(onPressed: () {}, child: const Text('Yes')),
          ),
        ),
      ),
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pop;
                },
                child: const Text('Cancel')),
          ),
        ),
      ),
    );
    await tester.pump();
  });
}
