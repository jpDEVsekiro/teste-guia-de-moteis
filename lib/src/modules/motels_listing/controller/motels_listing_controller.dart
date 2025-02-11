import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/data/interface/i_motels_listing_repository.dart';

class MotelsListingController extends ChangeNotifier {
  ValueNotifier<List<MotelModel>> motels = ValueNotifier([]);
  final IMotelsListingRepository motelsListingRepository =
      GetIt.I<IMotelsListingRepository>();

  List<CategoryItem> get categoryItems {
    List<CategoryItem> items = [];
    for (MotelModel motel in motels.value) {
      for (Suites suites in motel.suites ?? []) {
        for (CategoryItem category in suites.categoryItems ?? []) {
          if (items.any(
                (element) => element.nome == category.nome,
              ) ==
              false) items.add(category);
        }
      }
    }
    return items;
  }

  init() async {
    motels.value = await motelsListingRepository.getMotels();
    print('Motel: ${motels.value[0].name}');
  }

  MotelsListingController() {
    init();
  }
}
