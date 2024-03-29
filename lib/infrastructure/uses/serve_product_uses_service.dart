import 'package:product_tracker_app/domain/models/uses/purchase_use.dart';
import 'package:product_tracker_app/infrastructure/models/basic_get_request.dart';

class ServeProductUsesService {
  Future<List<PurchaseUse>> getPurchaseUses({required int purchaseId}) async {
    try {
      final res = await BasicGetRequest.make(
          path: 'uses/$purchaseId',
          onResolveOk: (response) {
            print(response);
            final List uses = response['data'];
            return uses.map((e) => PurchaseUse.fromJson(e)).toList();
          });

      return res.fold(
        (l) => [],
        (r) => r,
      );
    } catch (e) {
      return [];
    }
  }
}
