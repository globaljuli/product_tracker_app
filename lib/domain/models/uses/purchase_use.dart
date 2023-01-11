import 'dart:convert';

import 'package:product_tracker_app/domain/models/products/product.dart';

class PurchaseUse {
  PurchaseUse({
    required this.id,
    required this.purchaseId,
    required this.product,
    required this.useTypeId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int purchaseId;
  final Product product;
  final int useTypeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory PurchaseUse.fromRawJson(String str) =>
      PurchaseUse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurchaseUse.fromJson(Map<String, dynamic> json) => PurchaseUse(
        id: json["id"],
        purchaseId: json["purchase_id"],
        product: Product.fromJson(json["product"]),
        useTypeId: json["use_type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": purchaseId,
        "product": product.toJson(),
        "use_type_id": useTypeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
