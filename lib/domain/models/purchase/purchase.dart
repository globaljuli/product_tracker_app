import 'dart:convert';

import 'package:product_tracker_app/Domain/Models/Products/product.dart';
import 'package:product_tracker_app/domain/models/shops/shop.dart';

class Purchase {
  Purchase({
    required this.id,
    required this.productId,
    required this.shopId,
    required this.price,
    required this.discount,
    required this.finishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    required this.shop,
    required this.uses,
  }) {
    pricePerUse = (uses != 0) ? (price / uses).toStringAsFixed(2) : '∞';
  }

  final int id;
  final int productId;
  final int shopId;
  final double price;
  final dynamic discount;
  final DateTime? finishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Product product;
  final Shop shop;
  final int uses;
  late String pricePerUse;

  factory Purchase.fromRawJson(String str) =>
      Purchase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        id: json["id"],
        productId: json["product_id"],
        shopId: json["shop_id"],
        price: double.parse(json["price"].toString()),
        discount: json["discount"],
        finishedAt: json["finished_at"] == null
            ? null
            : DateTime.parse(json["finished_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
        shop: Shop.fromJson(json["shop"]),
        uses: json["uses"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "shop_id": shopId,
        "price": price,
        "discount": discount,
        "finished_at": finishedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
        "shop": shop.toJson(),
        "uses": uses,
      };
}
