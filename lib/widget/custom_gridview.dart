import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/cubit/add_cubit/layout_cubit.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widget/product_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
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
        return FutureBuilder(
            future: GetAllProducts().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 95),
                  clipBehavior: Clip.hardEdge,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 275,
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 20,
                      childAspectRatio: .5
                      // MediaQuery.of(context).size.width /
                      //     (MediaQuery.of(context).size.height),
                      ),
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      ProductItem(productModel: products[index]),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            });
      },
    );
  }
}
