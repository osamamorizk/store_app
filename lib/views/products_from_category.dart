import 'package:flutter/material.dart';
import 'package:store_app/Models/category_model.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/services/get_products_by_categ_id.dart';
import 'package:store_app/widget/custom_cart_item.dart';

class ProductsFromCategory extends StatelessWidget {
  const ProductsFromCategory({super.key});
  static String id = 'catproduct';
  @override
  Widget build(BuildContext context) {
    return CategoryProuductsBody();
  }
}

class CategoryProuductsBody extends StatefulWidget {
  const CategoryProuductsBody({super.key});

  @override
  State<CategoryProuductsBody> createState() => _CategoryProuductsBodyState();
}

class _CategoryProuductsBodyState extends State<CategoryProuductsBody> {
  @override
  Widget build(BuildContext context) {
    final categoryModel =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              categoryModel.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder(
            future:
                GetProductsByCategId().getProductsByCategId(categoryModel.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;

                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CategoryItemWidget(
                      productModel: products[index],
                      icon: const Icon(Icons.add),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
