import 'package:flutter/material.dart';
import 'package:store_app/Models/category_model.dart';
import 'package:store_app/consts%20copy.dart';
import 'package:store_app/services/get_categories.dart';
import 'package:store_app/views/products_from_category.dart';
import 'package:store_app/widget/category_name.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'Categories   ',
              style: TextStyle(
                  color: kcolor, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.category_outlined)
          ],
        ),
      ),
      body: FutureBuilder(
        future: GetCategories().getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CategoryModel> categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoryName(
                categoryModel: categories[index],
                onPressed: () {
                  Navigator.pushNamed(context, ProductsFromCategory.id,
                      arguments: categories[index]);
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


// Image(
//             fit: BoxFit.contain,
//             width: 80,
//             height: 80,
//             image: NetworkImage(
//               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYJv8RTsKmw9nmFVU9qwFHavX7VaxKJm11Wg&s',
//             ),
//           ),