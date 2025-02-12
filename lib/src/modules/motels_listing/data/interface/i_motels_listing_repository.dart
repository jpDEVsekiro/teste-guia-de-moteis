import 'package:guia_de_moteis/core/models/motel_model.dart';

abstract class IMotelsListingRepository {
  /// Fetches a list of motels.
  ///
  /// Returns a [Future] that completes with a list of [MotelModel] instances.
  Future<List<MotelModel>> getMotels();
}
