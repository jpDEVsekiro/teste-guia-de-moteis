import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/data/interface/i_motels_listing_repository.dart';

class MotelsListingController extends ChangeNotifier {
  ValueNotifier<List<MotelModel>> allMotels = ValueNotifier([]);
  ValueNotifier<List<MotelModel>> filterMotels = ValueNotifier([]);
  ValueNotifier<List<String>> filters = ValueNotifier([]);

  final IMotelsListingRepository motelsListingRepository =
      GetIt.I<IMotelsListingRepository>();

  List<CategoryItem> get allCategoryItems {
    List<CategoryItem> items = [];
    for (MotelModel motel in allMotels.value) {
      for (CategoryItem category in motel.categoryItems) {
        if (items.any(
              (element) => element.nome == category.nome,
            ) ==
            false) items.add(category);
      }
    }
    return items;
  }

  init() async {
    allMotels.value = await motelsListingRepository.getMotels();
    filterMotels.value = allMotels.value;
  }

  MotelsListingController() {
    init();
  }

  void onTapFavorite(int index) {
    allMotels.value[index].favorite = !allMotels.value[index].favorite;
    allMotels.notifyListeners();
    filterMotels.notifyListeners();
  }

  void filterByCategory(String category) {
    if (filters.value.contains(category)) {
      filters.value.remove(category);
    } else {
      filters.value.add(category);
    }
    filterAllMotels();
    filters.notifyListeners();
  }

  void filterAllMotels() {
    List<MotelModel> filteredMotels = [];
    if (filters.value.isEmpty) {
      filterMotels.value = allMotels.value;
      return;
    }
    for (MotelModel motel in allMotels.value) {
      if (motel.filterSuites(filters.value).isNotEmpty) {
        filteredMotels.add(motel);
      }
    }
    filterMotels.value = filteredMotels;
  }
}
