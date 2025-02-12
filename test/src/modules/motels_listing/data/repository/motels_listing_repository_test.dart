import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/core/http/interface/i_http_repository.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/data/repository/motels_listing_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../core/http/repository/mock_http_repository.dart';

void main() {
  group('MoTelsListingRepository', () {
    late MoTelsListingRepository repository;
    late MockHttpRepository mockHttpRepository;

    setUp(() {
      mockHttpRepository = MockHttpRepository();
      GetIt.I.reset();
      GetIt.I.registerSingleton<IHttpRepository>(mockHttpRepository);
      repository = MoTelsListingRepository();
      repository.httpRepository = mockHttpRepository;
    });

    test('initializesWithEmptyMotelList', () async {
      when(() => mockHttpRepository.get(any())).thenAnswer((_) async => {
            'data': {'moteis': []}
          });

      final motels = await repository.getMotels();

      expect(motels, isEmpty);
    });

    test('retrievesMotelsSuccessfully', () async {
      final motelData = [
        {'fantasia': 'Motel 1'},
        {'fantasia': 'Motel 2'}
      ];
      when(() => mockHttpRepository.get(any())).thenAnswer((_) async => {
            'data': {'moteis': motelData}
          });

      final motels = await repository.getMotels();

      expect(motels.length, 2);
      expect(motels[0].name, 'Motel 1');
      expect(motels[1].name, 'Motel 2');
    });

    test('handlesInvalidData', () async {
      when(() => mockHttpRepository.get(any())).thenAnswer((_) async => {
            'data': {'moteis': 'invalid'}
          });

      expect(
          () async => await repository.getMotels(), throwsA(isA<TypeError>()));
    });

    test('handlesEmptyResponse', () async {
      when(() => mockHttpRepository.get(any())).thenAnswer((_) async => {});

      final motels = await repository.getMotels();

      expect(motels, isEmpty);
    });
  });
}
