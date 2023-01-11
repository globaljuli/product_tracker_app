import 'dart:convert';

class Shop {
  Shop({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;

  factory Shop.fromRawJson(String str) => Shop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
