import 'package:flutter/material.dart';
import 'package:store_app/Models/category_model.dart';
import 'package:store_app/services/get_categories.dart';
import 'package:store_app/widget/category_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetCategories().getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CategoryModel> categories = snapshot.data!;
          List<CategoryModel> reversedCategories = categories.reversed.toList();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => CategoriesWidget(
              categoryModel: reversedCategories[index],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
