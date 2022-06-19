import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/Application/Models/Failure.dart';
import 'package:product_tracker_app/Domain/Models/Uses/ProductUse.dart';
import 'package:product_tracker_app/Domain/Models/Uses/ProductUseRegister.dart';
import 'package:product_tracker_app/Infrastructure/Models/PostRequest.dart';

class RegisterUseService {
  Future<Either<Failure, ProductUse>> registerUse(
      {required ProductUseRegister use}) async {
    final res = await BasicPostRequest.make(
        path: 'uses/register',
        bodyData: use.toJson(),
        onResolveOk: (response) {
          return ProductUse.fromJson(response['response']);
        });

    return res.fold((l) => Left(l), (r) => Right(r));
  }
}
