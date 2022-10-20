import 'package:product_tracker_app/Domain/Models/Uses/product_use.dart';
import 'package:product_tracker_app/Infrastructure/Uses/serve_product_uses_service.dart';

class ServeUsesHelper {
  Future<List<ProductUse>> getUses() async {
    final service = ServeProductUsesService();
    return await service.getProductUses(productId: 1);
  }
}
