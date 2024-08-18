import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Models/category_model.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/cubit/add_cubit/layout_cubit.dart';
import 'package:store_app/services/get_products_by_categ_id.dart';
import 'package:store_app/widget/categories_item.dart';

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
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
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
      body: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          if (state is LayoutAddSuccess) {
            Fluttertoast.showToast(
                msg: 'Cart Updated',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LayoutLoading
                ? inAsyncCall = true
                : inAsyncCall = false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FutureBuilder(
                  future: GetProductsByCategId()
                      .getProductsByCategId(categoryModel.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel> products = snapshot.data!;

                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CategoryItemWidget(
                            onPressed: () async {
                              await cubit.addOrRemoveCart(
                                  id: products[index].id.toString());
                            },
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
        },
      ),
    );
  }
}
