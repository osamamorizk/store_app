import 'package:flutter/material.dart';
import 'package:store_app/widget/category_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) => CategoriesWidget(),
      ),
    );
  }
}
