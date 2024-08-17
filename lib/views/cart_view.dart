import 'package:flutter/material.dart';
import 'package:store_app/consts.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });
  static String id = 'cart';

  // final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'Cart  ',
              style: TextStyle(
                  color: kcolor, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.shopping_cart)
          ],
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: ListView.builder(
      //             itemCount: 7,
      //             itemBuilder: (context, index) => Padding(
      //                   padding: EdgeInsets.symmetric(vertical: 8),
      //                   child: CategoryItemWidget(
      //                       productModel: productModel,
      //                       icon: Icon(Icons.remove)),
      //                 )),
      //       ),
      //       CustomButton(text: 'Bay Now')
      //     ],
      //   ),
      // ),
    );
  }
}
