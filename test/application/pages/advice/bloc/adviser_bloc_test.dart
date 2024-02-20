import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_app/application/pages/advice/bloc/adviser_bloc.dart';
import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/domain/failures/failures.dart';
import 'package:clean_architecture_app/domain/usecases/advice_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceUseCase extends Mock implements AdviceUseCase {}

void main() {
  group('Adviser Bloc', () {
    group('should emit', () {
      MockAdviceUseCase mockAdviceUseCase = MockAdviceUseCase();
      blocTest(
        'nothing when no method is called',
        build: () => AdviserBloc(adviceUseCase: mockAdviceUseCase),
        expect: () => <AdviserState>[],
      );
      blocTest(
        '[AdviserStateLoading, AdviserStateLoaded] when AdviseRequestedEvent triggered',
        setUp: () => when(() => mockAdviceUseCase.getAdvice()).thenAnswer(
            (invocation) => Future.value(Right<Failures, AdviceEntity>(
                AdviceEntity(adviceMessage: 'message', id: 1)))),
        build: () => AdviserBloc(adviceUseCase: mockAdviceUseCase),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        expect: () =>
            <AdviserState>[AdviserStateLoading(), AdviserStateLoaded('advice')],
      );
      blocTest(
        '[AdviserStateLoading, AdviserStateError] when AdviseRequestedEvent triggered',
        setUp: () => when(() => mockAdviceUseCase.getAdvice()).thenAnswer(
                (invocation) => Future.value(Left<Failures, AdviceEntity>(
                ServerFailure()))),
        build: () => AdviserBloc(adviceUseCase: mockAdviceUseCase),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        expect: () =>
        <AdviserState>[AdviserStateLoading(), AdviserStateError(serverFailureMessage)],
      );

      blocTest(
        '[AdviserStateLoading, AdviserStateError] when AdviseRequestedEvent triggered',
        setUp: () => when(() => mockAdviceUseCase.getAdvice()).thenAnswer(
                (invocation) => Future.value(Left<Failures, AdviceEntity>(
                CacheFailure()))),
        build: () => AdviserBloc(adviceUseCase: mockAdviceUseCase),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        expect: () =>
        <AdviserState>[AdviserStateLoading(), AdviserStateError(cacheFailureMessage)],
      );

      blocTest(
        '[AdviserStateLoading, AdviserStateError] when AdviseRequestedEvent triggered',
        setUp: () => when(() => mockAdviceUseCase.getAdvice()).thenAnswer(
                (invocation) => Future.value(Left<Failures, AdviceEntity>(
                GeneralFailure()))),
        build: () => AdviserBloc(adviceUseCase: mockAdviceUseCase),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        expect: () =>
        <AdviserState>[AdviserStateLoading(), AdviserStateError(generalFailureMessage)],
      );
      
    });
  });
}
