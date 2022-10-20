import 'dart:convert';

import 'package:flutter/cupertino.dart';

class ProductUse {
  ProductUse({
    required this.id,
    required this.purchaseId,
    required this.purchaseName,
    required this.useTypeId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int purchaseId;
  final String purchaseName;
  final int useTypeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ProductUse.fromRawJson(String str) =>
      ProductUse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductUse.fromJson(Map<String, dynamic> json) => ProductUse(
        id: json["id"],
        purchaseId: json["purchase_id"],
        purchaseName: json["purchase_name"] ?? '',
        useTypeId: json["use_type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": purchaseId,
        "use_type_id": useTypeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  TableRow toTableRow() {
    return TableRow(children: [
      Text(id.toString()),
      Text(purchaseName),
    ]);
  }
}
