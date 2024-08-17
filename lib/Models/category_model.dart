class CategoryModel {
  final String name;
  final String image;
  final int id;

  CategoryModel({required this.id, required this.name, required this.image});

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
        name: json['name'], image: json['image'], id: json['id']);
  }
}
