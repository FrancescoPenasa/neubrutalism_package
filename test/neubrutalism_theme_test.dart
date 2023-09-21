import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neobrutalism_theme/neubrutalism_theme.dart';

class Tester {
  Tester(this.value);
  int value = 0;

  void increment() {
    value = value + 1;
  }

  int getValue() {
    return this.value;
  }
}

void main() {
  group('Button Widget', () {
    testWidgets('Button tap should trigger action', (WidgetTester tester) async {
      final functionTester = Tester(0);

      // Build the widget tree
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Center(
              child: NeuButton(
                onPressed: functionTester.increment,
                child: const Text('Test Button'),
              ),
            ),
          ),
        ),
      );

      // Simulate a tap on the button
      await tester.tap(find.text('Test Button'));
      await tester.pump();

      // Make assertions about the state or behavior of the button
      expect(functionTester.getValue(), 1);
    });
  });
}