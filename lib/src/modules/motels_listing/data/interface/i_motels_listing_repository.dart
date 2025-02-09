import 'package:guia_de_moteis/core/models/motel_model.dart';

abstract class IMotelsListingRepository {
  Future<List<MotelModel>> getMotels();
}
