import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/widget/customPlusButton.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            fit: BoxFit.fill,
            // width: 190,
            height: 170,
            image: NetworkImage(
              productModel.image,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    productModel.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3, right: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  r'$' ' ${productModel.price.toString()}',
                  style: TextStyle(fontSize: 16),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: CustomPlusButton(
                    icon: Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
