import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/application/models/failure.dart';
import 'package:product_tracker_app/domain/models/uses/purchase_use.dart';
import 'package:product_tracker_app/domain/models/uses/purchase_use_register.dart';
import 'package:product_tracker_app/infrastructure/models/basic_post_request.dart';

class RegisterUseService {
  Future<Either<Failure, PurchaseUse>> registerUse(
      {required PurchaseUseRegister use}) async {
    final res = await BasicPostRequest.make(
        path: 'uses/register',
        bodyData: use.toJson(),
        onResolveOk: (response) {
          return PurchaseUse.fromJson(response['response']);
        });

    return res.fold((l) => Left(l), (r) => Right(r));
  }
}
