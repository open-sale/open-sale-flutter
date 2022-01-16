/// To parse this JSON data, do
///
///     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.size,
    required this.color,
    required this.category,
  });

  int id;
  String name;
  String description;
  String image;
  String price;
  String size;
  String color;
  String category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        size: json["size"],
        color: json["color"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "size": size,
        "color": color,
        "category": category,
      };
}
