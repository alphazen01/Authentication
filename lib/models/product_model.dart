// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
    int totalSize;
    int typeId;
    int offset;
    List<Product> products;

    ProductsModel({
        required this.totalSize,
        required this.typeId,
        required this.offset,
        required this.products,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        totalSize: json["total_size"],
        typeId: json["type_id"],
        offset: json["offset"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "type_id": typeId,
        "offset": offset,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    String name;
    String description;
    int price;
    int stars;
    String img;
    String location;
    DateTime createdAt;
    DateTime updatedAt;
    int typeId;

    Product({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.stars,
        required this.img,
        required this.location,
        required this.createdAt,
        required this.updatedAt,
        required this.typeId,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        img: json["img"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        typeId: json["type_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "img": img,
        "location": location,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type_id": typeId,
    };
}
