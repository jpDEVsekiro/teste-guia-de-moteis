import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/core/http/interface/i_http_repository.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/data/interface/i_motels_listing_repository.dart';

class MoTelsListingRepository implements IMotelsListingRepository {
  IHttpRepository httpRepository = GetIt.I.get<IHttpRepository>();

  @override
  Future<List<MotelModel>> getMotels() async {
    Map map = await httpRepository.get('1IXK');
    List<MotelModel> motels = [];
    for (var item in map['data']?['moteis'] ?? []) {
      motels.add(MotelModel.fromJson(item));
    }
    return motels;
  }
}
