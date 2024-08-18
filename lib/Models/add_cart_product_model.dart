// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class AddCartProductModel {
  final bool status;
  final String message;
  final Data data;

  AddCartProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddCartProductModel.fromJson(Map<String, dynamic> json) =>
      AddCartProductModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final int quantity;
  final Product product;

  Data({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "product": product.toJson(),
      };
}

class Product {
  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
      };
}
