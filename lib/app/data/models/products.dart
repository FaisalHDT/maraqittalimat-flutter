// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.id,
    this.name,
    this.brand,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? brand;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
