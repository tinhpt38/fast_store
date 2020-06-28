import 'package:fast_store/core/model/category.dart';

class Product {
  final int categoryId;
  final int id;
  final String name;
  final String phoneNumber;
  final int price;
  final int quantity;
  final String location;
  final String createdAt;
  final String imageUrl;
  final String updatedAt;
  final int viewCount;
  final String description;
  final Category category;

  Product(
      {this.category,
      this.id,
      this.createdAt,
      this.imageUrl,
      this.name,
      this.phoneNumber,
      this.description,
      this.price,
      this.quantity,
      this.updatedAt,
      this.viewCount,
      this.location,
      this.categoryId});

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        createdAt = json["created_at"],
        imageUrl = json["image_url"],
        name = json["name"],
        phoneNumber = json["phone_number"],
        description = json["description"],
        price = json["price"],
        quantity = json["quantity"],
        updatedAt = json["updated_at"],
        viewCount = json["view_count"],
        location = json["location"],
        category = Category.fromJson(json["category"]),
        categoryId = json["category_id"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "image_url": imageUrl,
        "name": name,
        "phone_number": phoneNumber,
        "description": description,
        "price": price,
        "quantity": quantity,
        "view_count": viewCount,
        "location": location
      };
}
