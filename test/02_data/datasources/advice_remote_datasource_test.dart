import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/exceptions/exceptions.dart';
import 'package:advicer/0_data/models/advice_model.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDatasourece', () {
    group('should return AdviceModel', () {
      test('when Client responds with 200 and has valid data', () async {
        const responseBody = '{"advice": "test advice", "advice_id": 1}';
        final mockClient = MockClient((request) async {
          return Response(responseBody, 200);
        });

        //  when(mockClient.get(
        //   Uri.parse(
        //     'https://api.flutter-community.com/api/v1/advice',
        //   ),
        //   headers: {
        //     'Content-Type': 'application/json',
        //   },
        // )).thenAnswer(
        //     (realInvocation) => Future.value(Response(responseBody, 200)));

        final adviceRemoteDatasourceUnderTest =
            AdviceRemoteDatasourceImpl(client: mockClient);

        final result =
            await adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi();

        expect(result, AdviceModel(advice: 'test advice', id: 1));
      });
    });
  });
}
