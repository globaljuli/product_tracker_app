import 'package:product_tracker_app/Domain/Models/Uses/ProductUse.dart';
import 'package:product_tracker_app/Infrastructure/Uses/ServeProductUsesService.dart';

class ServeUsesHelper {
  Future<List<ProductUse>> getUses() async {
    final service = ServeProductUsesService();
    return await service.getProductUses(productId: 1);
  }
}
