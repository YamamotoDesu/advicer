import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/exceptions/exceptions.dart';
import 'package:advicer/0_data/models/advice_model.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'article_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDatasourceImpl>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return AdviceEntity', () {
      test('when AdiceRemoteDatasourece returns as AdviceModel', () async {
        final mockAdviceRemoteDatasouce = MockAdviceRemoteDatasourceImpl();
        final advieRepoImplUnserTest =
            AdviceRepoImpl(adviceRemoteDatasource: mockAdviceRemoteDatasouce);

        when(mockAdviceRemoteDatasouce.getRandomAdviceFromApi()).thenAnswer(
            (realInvocation) =>
                Future.value(AdviceModel(advice: 'test advice', id: 1)));

        final result = await advieRepoImplUnserTest.getAdviceFromDatasource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(
            result,
            Right<Failure, AdviceModel>(
                AdviceModel(advice: 'test advice', id: 1)));
        verify(mockAdviceRemoteDatasouce.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDatasouce);
      });
    });
  });
}
