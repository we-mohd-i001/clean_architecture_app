import 'dart:io';

import 'package:clean_architecture_app/data/datasources/advice_remote_data_resource.dart';
import 'package:clean_architecture_app/data/models/advice_model.dart';
import 'package:clean_architecture_app/data/repositories/advice_repo_impl.dart';
import 'package:clean_architecture_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/domain/exceptions.dart';
import 'package:clean_architecture_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataResourceImpl>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return AdviceEntity', () {
      test('when AdviceRemoteDataResource returns an AdviceModel', () async {
        final mockadviceRemoteDataResourceImpl =
            MockAdviceRemoteDataResourceImpl();
        final adviceRepoImplUnderTest = AdviceRepoImpl(
            adviceRemoteDataResource: mockadviceRemoteDataResourceImpl);

        when(mockadviceRemoteDataResourceImpl.getRandomAdviceFromApi())
            .thenAnswer((realInvocation) =>
                Future.value(AdviceModel(advice: 'test', id: 42)));

        final result = await adviceRepoImplUnderTest.getAdviceFromDataSource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,
            Right<Failures, AdviceModel>(AdviceModel(advice: 'test', id: 42)));

        verify(await mockadviceRemoteDataResourceImpl.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockadviceRemoteDataResourceImpl);
      });
    });
    group('should return left with', (){
      test('a ServerFailure when a ServeEsception occurs', () async{
        final mockadviceRemoteDataResourceImpl =
        MockAdviceRemoteDataResourceImpl();
        final adviceRepoImplUnderTest = AdviceRepoImpl(
            adviceRemoteDataResource: mockadviceRemoteDataResourceImpl);

        when(mockadviceRemoteDataResourceImpl.getRandomAdviceFromApi()).thenThrow(ServerException());

        final result = await adviceRepoImplUnderTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failures, AdviceEntity>(GeneralFailure()));

      });
      test('a GeneralFailure on all other Exceptions', () async{
        final mockadviceRemoteDataResourceImpl =
        MockAdviceRemoteDataResourceImpl();
        final adviceRepoImplUnderTest = AdviceRepoImpl(
            adviceRemoteDataResource: mockadviceRemoteDataResourceImpl);

        when(mockadviceRemoteDataResourceImpl.getRandomAdviceFromApi()).thenThrow(const SocketException('test'));

        final result = await adviceRepoImplUnderTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failures, AdviceEntity>(GeneralFailure()));

      });
    });
  });
}
