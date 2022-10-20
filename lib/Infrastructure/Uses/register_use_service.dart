import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/Application/models/failure.dart';
import 'package:product_tracker_app/Domain/Models/Uses/product_use.dart';
import 'package:product_tracker_app/Domain/Models/Uses/product_use_register.dart';
import 'package:product_tracker_app/Infrastructure/Models/basic_post_request.dart';

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
