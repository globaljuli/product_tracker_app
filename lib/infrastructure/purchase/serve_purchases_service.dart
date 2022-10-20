import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/application/models/failure.dart';
import 'package:product_tracker_app/Domain/Models/Products/product.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/Models/basic_get_request.dart';

class ServePurchasesService {
  Future<Either<Failure, List<Product>>> getPurchasesInfo() async {
    final res = await BasicGetRequest.make(
        path: 'purchases',
        onResolveOk: (response) {
          final List<Product> products = [];
          for (var product in response['response']) {
            products.add(Product.fromJson(product));
          }
          return Right(products);
        });

    return res.fold(
      (l) => Left(l),
      (r) => Right(r as List<Product>),
    );
  }

  Future<Either<Failure, Purchase>> getPurchaseInfo(
      {required int purchaseId}) async {
    final res = await BasicGetRequest.make(
        path: 'purchase/$purchaseId',
        onResolveOk: (response) {
          return Purchase.fromJson(response['response']);
        });

    return res.fold(
      (l) => Left(l),
      (r) => Right(r as Purchase),
    );
  }
}
