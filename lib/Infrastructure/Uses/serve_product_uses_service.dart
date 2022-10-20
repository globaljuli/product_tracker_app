import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/Domain/Models/Uses/product_use.dart';
import 'package:product_tracker_app/Infrastructure/Models/basic_get_request.dart';

class ServeProductUsesService {
  Future<List<ProductUse>> getProductUses({required int productId}) async {
    try {
      final res = await BasicGetRequest.make(
          path: 'uses/$productId',
          onResolveOk: (response) {
            final uses = List<ProductUse>.from(response['uses']);
            return Right(uses);
          });

      return res.fold(
        (l) => getMockUses(),
        (r) => r,
      );
    } catch (e) {
      return getMockUses();
    }
  }

  List<ProductUse> getMockUses() {
    return [
      ProductUse(
          id: 1,
          purchaseId: 2,
          purchaseName: 'Xiaomi',
          useTypeId: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()),
      ProductUse(
          id: 2,
          purchaseId: 2,
          purchaseName: 'Xiaomi',
          useTypeId: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()),
      ProductUse(
          id: 3,
          purchaseId: 2,
          purchaseName: 'Xiaomi',
          useTypeId: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()),
      ProductUse(
          id: 4,
          purchaseId: 2,
          purchaseName: 'Xiaomi',
          useTypeId: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()),
    ];
  }
}
