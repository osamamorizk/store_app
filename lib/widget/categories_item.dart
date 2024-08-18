import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/cubit/add_cubit/layout_cubit.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.icon,
    required this.productModel,
    this.onPressed,
  });
  final Widget icon;
  final ProductModel productModel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return Container(
      height: 90,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.07))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              fit: BoxFit.fill,
              height: 90,
              width: 90,
              image: NetworkImage(
                productModel.image,
              ),
            ),
          ),
          SizedBox(
            width: 130,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  productModel.name,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  r'$' ' ${productModel.price.toString()}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              cubit.productsId.contains(productModel.id.toString())
                  ? Icons.remove_shopping_cart
                  : Icons.add_shopping_cart,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
