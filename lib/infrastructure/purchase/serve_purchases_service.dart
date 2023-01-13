import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/application/models/failure.dart';
import 'package:product_tracker_app/application/providers/purchases/selection/purchase_selection_provider.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/models/basic_get_request.dart';

class ServePurchasesService {
  Future<Either<Failure, List<Purchase>>> getOpenPurchases() async {
    final res = await BasicGetRequest.make(
        path: 'purchases/open',
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

  Future<Either<Failure, UserProductPurchases>> getAllPurchases() async {
    final res = await BasicGetRequest.make(
        path: 'purchases',
        onResolveOk: (response) {
          final resPurchases = response["data"];

          final List<Purchase> openPurchases = [];
          final List<Purchase> closedPurchases = [];

          for (var purchase in resPurchases['open_purchases']) {
            openPurchases.add(Purchase.fromJson(purchase));
          }

          for (var purchase in resPurchases['closed_purchases']) {
            closedPurchases.add(Purchase.fromJson(purchase));
          }

          final purchases = UserProductPurchases(
            openPurchases: openPurchases,
            closedPurchases: closedPurchases,
          );

          return purchases;
        });

    return res.fold(
      (l) => Left(l),
      (r) => Right(r as UserProductPurchases),
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
