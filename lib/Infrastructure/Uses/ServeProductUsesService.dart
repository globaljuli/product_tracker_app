import 'package:product_tracker_app/Infrastructure/Models/BasicGetRequest.dart';

class ServeProductUsesService {
  getProductUses({required int productId}) {
    BasicGetRequest.make(
        path: 'uses/$productId',
        onResolveOk: (response) {
          return response;
        });
  }
}
