import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.productModel,
    this.onPressed,
    required this.icon,
  });

  final ProductModel productModel;
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(.1))),
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
            width: 150,
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
                  productModel.price.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: icon,
          )
        ],
      ),
    );
  }
}
