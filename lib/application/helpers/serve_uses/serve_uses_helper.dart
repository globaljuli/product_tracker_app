import 'package:product_tracker_app/domain/models/uses/purchase_use.dart';
import 'package:product_tracker_app/infrastructure/uses/serve_product_uses_service.dart';

class ServeUsesHelper {
  Future<List<PurchaseUse>> getUses({required int purchaseId}) async {
    final service = ServeProductUsesService();
    return await service.getPurchaseUses(purchaseId: purchaseId);
  }
}
