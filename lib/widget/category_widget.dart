import 'package:flutter/material.dart';
import 'package:store_app/Models/category_model.dart';
import 'package:store_app/views/products_from_category.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductsFromCategory.id,
              arguments: categoryModel);
        },
        child: SizedBox(
          height: 75,
          width: 80,
          child: Column(
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(categoryModel.image)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                categoryModel.name,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
