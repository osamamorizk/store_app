import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/widget/customPlusButton.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.icon,
    required this.productModel,
  });
  final Widget icon;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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
            width: 100,
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
          const CustomPlusButton(
            icon: Icon(Icons.add),
          ),
          const CustomPlusButton(
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
