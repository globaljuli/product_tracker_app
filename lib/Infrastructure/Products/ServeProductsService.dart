import 'package:dartz/dartz.dart';
import 'package:product_tracker_app/Application/Models/Failure.dart';
import 'package:product_tracker_app/Domain/Models/Products/Product.dart';
import 'package:product_tracker_app/Infrastructure/Models/BasicGetRequest.dart';

class ServeProductService {
  Future<Either<Failure, List<Product>>> getProducts() async {
    final res = await BasicGetRequest.make(
        path: 'products',
        onResolveOk: (response) {
          final List<Product> products = [];
          for (var product in response['products']) {
            products.add(Product.fromJson(product));
          }
          return Right(products);
        });

    return res.fold(
      (l) => Left(l),
      (r) => Right(r as List<Product>),
    );
  }

  Future<Either<Failure, Product>> getProduct({required int productId}) async {
    final res = await BasicGetRequest.make(
        path: 'product/$productId',
        onResolveOk: (response) {
          return Right(Product.fromJson(response));
        });

    return res.fold(
      (l) => Left(l),
      (r) => Right(r as Product),
    );
  }
}
