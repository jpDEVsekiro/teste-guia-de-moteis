import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/core/http/interface/i_http_repository.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/controller/motels_listing_controller.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/data/interface/i_motels_listing_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/http/repository/mock_http_repository.dart';
import '../data/repository/mock_motels_listing_repository.dart';

void main() {
  group('MotelsListingController', () {
    late MotelsListingController controller;
    MockMotelsListingRepository mockRepository = MockMotelsListingRepository();

    setUp(() {
      GetIt.I.reset();
      GetIt.I.registerSingleton<IHttpRepository>(MockHttpRepository());
      GetIt.I.registerSingleton<IMotelsListingRepository>(mockRepository);
      final motels = [motel1, motel2];
      when(mockRepository.getMotels).thenAnswer((_) async => motels);
      controller = MotelsListingController();
    });

    test('init populates allMotels and filterMotels', () async {
      final motels = [motel1, motel2];
      when(mockRepository.getMotels).thenAnswer((_) async => motels);
      controller = MotelsListingController();

      await controller.init();

      expect(controller.allMotels.value, motels);
      expect(controller.filterMotels.value, motels);
    });

    test('onTapFavorite toggles favorite status', () {
      final motel = MotelModel(name: 'Motel 1', favorite: false);
      controller.allMotels.value = [motel];

      controller.onTapFavorite(0);

      expect(controller.allMotels.value[0].favorite, isTrue);
    });

    test('filterByCategory adds and removes category from filters', () {
      controller.filterByCategory('Category 1');
      expect(controller.filters.value, contains('Category 1'));

      controller.filterByCategory('Category 1');
      expect(controller.filters.value, isNot(contains('Category 1')));
    });

    test('filterAllMotels filters motels by category', () {
      controller.allMotels.value = [motel1, motel2];

      controller.filters.value = ['Category 1'];
      controller.filterAllMotels();

      expect(controller.filterMotels.value, [motel1]);
    });

    test('filterAllMotels returns all motels if no filters are applied', () {
      controller.allMotels.value = [motel1, motel2];

      controller.filters.value = [];
      controller.filterAllMotels();

      expect(controller.filterMotels.value, [motel1, motel2]);
    });
  });
}

final motel1 = MotelModel(name: 'Motel 1', suites: [
  Suites(
      motelName: 'Motel 1',
      neighborhood: 'neighborhood 1',
      categoryItems: [CategoryItem(nome: 'Category 1')])
]);
final motel2 = MotelModel(name: 'Motel 2', suites: [
  Suites(
      motelName: 'Motel 2',
      neighborhood: 'neighborhood 2',
      categoryItems: [CategoryItem(nome: 'Category 2')])
]);
