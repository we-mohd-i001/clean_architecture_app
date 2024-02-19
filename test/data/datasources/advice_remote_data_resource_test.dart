import 'package:clean_architecture_app/data/datasources/advice_remote_data_resource.dart';
import 'package:clean_architecture_app/data/models/advice_model.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

import 'advice_remote_data_resource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDatResource', () {
    group('should return AdviceModel', () {
      test('when client response was 200 and has valid data', () async {
        final mockClient = MockClient();
        final adviceRemoteDataResourceUnderTest =
            AdviceRemoteDataResourceImpl(client: mockClient);
        const responseBody = '{"advice" : "test advice", "advice_id": 1}';
        when(mockClient
            .get(Uri.parse('https://api.flutter-community.com/api/v1/advice'),
                headers: {'content-type': 'application/json'})).thenAnswer(
            (realInvocation) => Future.value(Response(responseBody, 200)));
        final result =
            await adviceRemoteDataResourceUnderTest.getRandomAdviceFromApi();
        expect(result, AdviceModel(advice: 'test advice', id: 1));
      });
    });
  });
}
