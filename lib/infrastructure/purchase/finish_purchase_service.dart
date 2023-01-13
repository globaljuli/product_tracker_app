import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/application/models/failure.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/models/basic_get_request.dart';

class FinishPurchaseService {
  Future<Either<Failure, Purchase>> markPurchaseAsFinished(
      {required purchaseId}) async {
    final res = await BasicGetRequest.make(
      path: 'purchase/finish/$purchaseId',
      onResolveOk: (response) =>
          Purchase.fromJson(response["data"]["purchase"]),
    );

    return res.fold(
      (l) => Left(l),
      (r) => Right(r as Purchase),
    );
  }
}
