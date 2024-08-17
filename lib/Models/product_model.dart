class ProductModel {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  final bool inFavorites;
  final bool inCart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(json) => ProductModel(
        price: json["price"]?.toDouble(),
        oldPrice: json["old_price"]?.toDouble(),
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
        id: json['id'],
      );
}
