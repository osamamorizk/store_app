import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/cubit/add_cubit/layout_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            fit: BoxFit.fill,
            width: 155,
            height: 135,
            image: NetworkImage(
              productModel.image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 16,
                // ),

                Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    productModel.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  r'$' ' ${productModel.price.toString()}',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () async {
                    await cubit.addOrRemoveCart(id: productModel.id.toString());
                  },
                  icon: Icon(
                    cubit.productsId.contains(productModel.id.toString())
                        ? Icons.remove_shopping_cart
                        : Icons.add_shopping_cart,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
