import 'package:clean_architecture_app/application/core/services/theme_service.dart';
import 'package:clean_architecture_app/application/pages/advice/adviser_page.dart';
import 'package:clean_architecture_app/application/pages/advice/bloc/adviser_bloc.dart';
import 'package:clean_architecture_app/application/pages/advice/widgets/advice_field.dart';
import 'package:clean_architecture_app/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:provider/provider.dart';

class MockAdviserBloc extends MockBloc<AdviserEvent, AdviserState>
    implements AdviserBloc {}

void main() {
  Widget widgetUnderTest({required AdviserBloc bloc}) {
    return ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: MaterialApp(
        home: BlocProvider<AdviserBloc>(
          create: (context) => bloc,
          child: const AdviserPage(),
        ),
      ),
    );
  }

  group('AdviserPage', () {
    late AdviserBloc mockAdviserBloc;

    setUp(() {
      mockAdviserBloc = MockAdviserBloc();
    });
    group('should be displayed in ViewState', () {
      testWidgets(
          'Initial when bloc emits AdviserInitial()', (widgetTester) async {
        whenListen(mockAdviserBloc, Stream.fromIterable([AdviserInitial()]),
          initialState: AdviserInitial(),
        );

        await widgetTester.pumpWidget(widgetUnderTest(bloc: mockAdviserBloc));
        
        final adviserInitialTextFinder = find.text('Your advice is waiting for you!');

        expect(adviserInitialTextFinder, findsOneWidget);
      });

      testWidgets(
          'Loading when bloc emits AdviserStateLoading()', (widgetTester) async {
        whenListen(mockAdviserBloc, Stream.fromIterable([AdviserStateLoading()]),
          initialState: AdviserInitial(),
        );

        await widgetTester.pumpWidget(widgetUnderTest(bloc: mockAdviserBloc));
        await widgetTester.pump();

        final adviserLoadingStateFinder = find.byType(CircularProgressIndicator);


        expect(adviserLoadingStateFinder, findsOneWidget);
      });
      testWidgets(
          'Loaded when bloc emits AdviserStateLoaded()', (widgetTester) async {
        whenListen(mockAdviserBloc, Stream.fromIterable([AdviserStateLoaded('advice')]),
          initialState: AdviserInitial(),
        );

        await widgetTester.pumpWidget(widgetUnderTest(bloc: mockAdviserBloc));
        await widgetTester.pump();

        final adviserLoadedStateFinder = find.byType(AdviceField);


        expect(adviserLoadedStateFinder, findsOneWidget);
      });
      testWidgets(
          'Error when bloc emits AdviserStateError  ()', (widgetTester) async {
        whenListen(mockAdviserBloc, Stream.fromIterable([AdviserStateError('error')]),
          initialState: AdviserInitial(),
        );

        await widgetTester.pumpWidget(widgetUnderTest(bloc: mockAdviserBloc));
        await widgetTester.pump();

        final adviserErrorStateFinder = find.byType(ErrorMessage);


        expect(adviserErrorStateFinder, findsOneWidget);
      });
    });
  });
}