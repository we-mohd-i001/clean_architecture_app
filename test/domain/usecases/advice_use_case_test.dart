import 'package:clean_architecture_app/data/repositories/advice_repo_impl.dart';
import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/domain/exceptions.dart';
import 'package:clean_architecture_app/domain/failures/failures.dart';
import 'package:clean_architecture_app/domain/usecases/advice_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main() {
  group('AdviceUseCases', () {
    group('should return AdviceEntity', () {
      test('when AdviceRepoImpl returns an AdviceModel', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCasesUnderTest =
            AdviceUseCase(adviceRepoImpl: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
            (realInvocation) => Future.value(
                Right(AdviceEntity(adviceMessage: 'test', id: 42))));

        final result = await adviceUseCasesUnderTest.getAdvice();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(
            result,
            Right<Failures, AdviceEntity>(
                AdviceEntity(adviceMessage: 'test', id: 42)));

        verify(await mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });
    group('should return left with', () {
      test('a ServerFailure', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCasesUnderTest =
        AdviceUseCase(adviceRepoImpl: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviceFromDataSource())
            .thenAnswer((realInvocation) => Future.value(Left(ServerFailure())));

        final result = await adviceUseCasesUnderTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failures, AdviceEntity>(ServerFailure()));
        verify(await mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });

      test('a GeneralFailure', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCasesUnderTest =
        AdviceUseCase(adviceRepoImpl: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviceFromDataSource())
            .thenAnswer((realInvocation) => Future.value(Left(GeneralFailure())));

        final result = await adviceUseCasesUnderTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failures, AdviceEntity>(GeneralFailure()));
      });
    });
  });
}
