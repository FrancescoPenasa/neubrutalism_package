import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neubrutalism_theme/neubrutalism_theme.dart';

void main() {
  group('Button Widget', () {
    testWidgets('Button tap should trigger action',
        (WidgetTester tester) async {
      bool isPressed = false;

      // Build the widget tree
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Center(
              child: NeuButton(
                btnType: NeuBtnType.square,
                onPressed: () {
                  isPressed = true;
                },
                child: const Text('Test Button'),
              ),
            ),
          ),
        ),
      );

      // Simulate a tap on the button
      await tester.tap(find.text('Test Button'));
      await tester.pumpAndSettle();

      // Make assertions about the state or behavior of the button
      expect(isPressed, true);
    });
    testWidgets('Button tap should trigger action',
            (WidgetTester tester) async {
          bool isPressed = false;

          // Build the widget tree
          await tester.pumpWidget(
            MaterialApp(
              home: Material(
                child: Center(
                  child: NeuButton(
                    btnType: NeuBtnType.round,
                    onPressed: () {
                      isPressed = true;
                    },
                    child: const Text('Test Button'),
                  ),
                ),
              ),
            ),
          );

          // Simulate a tap on the button
          await tester.tap(find.text('Test Button'));
          await tester.pumpAndSettle();

          // Make assertions about the state or behavior of the button
          expect(isPressed, true);
        });
  });
}
