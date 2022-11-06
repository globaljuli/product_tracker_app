import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/application/models/failure.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/models/basic_get_request.dart';

class ServePurchasesService {
  Future<Either<Failure, List<Purchase>>> getPurchasesInfo() async {
    final res = await BasicGetRequest.make(
        path: 'purchases',
        onResolveOk: (response) {
          final List<Purchase> purchases = [];
          for (var purchase in response['response']) {
            purchases.add(Purchase.fromJson(purchase));
          }
          return purchases;
        });

    return res.fold(
      (l) => Left(l),
      (r) => Right(r as List<Purchase>),
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
