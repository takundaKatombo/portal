//import 'package:flutter/foundation.dart';

enum Category {
  all,
  meat,
  fruits,
  cereal,
}

class Product {
  Product(
      {this.category,
      this.id,
      this.isFeatured,
      this.name,
      this.price,
      this.imageName,
      this.quantity});

  Product.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson["id"],
        isFeatured = parsedJson["isFeatured"],
        name = parsedJson["name"],
        price = parsedJson["price"],
        imageName = parsedJson["imageName"],
        quantity = parsedJson["quantity"];

  Category category;
  String id;
  bool isFeatured;
  String name;
  String imageName;
  int price;
  int quantity;
}
