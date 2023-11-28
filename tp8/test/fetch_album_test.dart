import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tp8/main.dart';

void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient((request) async {
        return http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200);
      });
      expect(await fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final client = MockClient((request) async {
        return http.Response('Not Found', 404);
      });
      expect(fetchAlbum(client), throwsException);
    });
  });
}
