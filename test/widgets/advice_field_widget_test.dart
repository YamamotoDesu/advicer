import 'package:advicer/2_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnserTest({required String adviceText}) {
    return MaterialApp(
      home: AdviceField(advice: adviceText),
    );
  }
  

  group('AdviceField', () {
    group('should be displayed correctly', () {

      testWidgets('when a short text is given', (widgetTester) async {
        const text = 'a';

        await widgetTester.pumpWidget(widgetUnserTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining('a');

        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when a long text is given', (widgetTester) async {
        const text = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';

        await widgetTester.pumpWidget(widgetUnserTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(AdviceField);

        expect(adviceFieldFinder, findsOneWidget);
      });
    });
  });
}