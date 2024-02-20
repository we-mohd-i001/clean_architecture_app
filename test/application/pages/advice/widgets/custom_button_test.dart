import 'package:clean_architecture_app/application/pages/advice/bloc/adviser_bloc.dart';
import 'package:clean_architecture_app/application/pages/advice/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

abstract class OnCustomButtonTap {
  void call();
}

class MockOnCustomButtonTap extends Mock implements OnCustomButtonTap {}

void main() {
  Widget widgetUnderMethod({Function()? callBack}) {
    return MaterialApp(
      home: Scaffold(
        body: CustomButton(
          buttonText: 'Get Advice',
          onTap: callBack,
        ),
      ),
    );
  }

  group('CustomButton', () {
    group('is button rendered correctly', () {
      testWidgets('and has aal parts that it needs', (widgetTester) async {
        await widgetTester.pumpWidget(widgetUnderMethod());

        final buttonTextFinder = find.text('Get Advice');

        expect(buttonTextFinder, findsOneWidget);
      });
    });
    group('should handle onTap', () {
      testWidgets('when the button has been pressed', (widgetTester) async {
        final mockOnCustomButtonTap = MockOnCustomButtonTap();
        await widgetTester.pumpWidget(widgetUnderMethod(callBack: mockOnCustomButtonTap));
        final customButtonFinder = find.byType(CustomButton);
        widgetTester.tap(customButtonFinder);
        verify(mockOnCustomButtonTap()).called(1);
      });
    });
  });
}
