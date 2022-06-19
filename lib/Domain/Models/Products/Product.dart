import 'dart:convert';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.productCategoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String description;
  final dynamic imagePath;
  final int productCategoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imagePath: json["image_path"],
        productCategoryId: json["product_category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_path": imagePath,
        "product_category_id": productCategoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
