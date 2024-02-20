import 'package:clean_architecture_app/application/pages/advice/widgets/advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String adviceText}) {
    return MaterialApp(
      home: AdviceField(
        adviceText: adviceText,
      ),
    );
  }

  group('AdviceField', () {
    group('should be displayed correctly', () {
      testWidgets('when short text is given', (widgetTester) async {
        const text = 'a';
        await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining('a');
        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when long text is given', (widgetTester) async {
        const text =
            'A very long text for testing the widget AdviceField here at webreinvent I am learning to test widgets by widget testing method.';
        await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(AdviceField);

        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when no text is given', (widgetTester) async {
        const text =
            '';
        await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.text(AdviceField.emptyAdvice);

        final adviceText = widgetTester.widget<AdviceField>(find.byType(AdviceField)).adviceText;

        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, '');
      });
    });
  });
}
