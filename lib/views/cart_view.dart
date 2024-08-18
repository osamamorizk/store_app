import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/consts.dart';
import 'package:store_app/cubit/add_cubit/layout_cubit.dart';
import 'package:store_app/widget/cart_bu_custom_button.dart';
import 'package:store_app/widget/cart_item_widget.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
  });
  static String id = 'cart';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    cubit.getCart();
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (state is LayoutAddSuccess) {
          Fluttertoast.showToast(
              msg: 'Successfully Deleted ',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }

        // if (state is LayoutFailure) {
        //   Fluttertoast.showToast(
        //       msg: 'Fail to update cart',
        //       toastLength: Toast.LENGTH_LONG,
        //       gravity: ToastGravity.SNACKBAR,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.green,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        // }
      },
      builder: (context, state) {
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
          body: ModalProgressHUD(
            inAsyncCall: state is LayoutLoading
                ? inAsyncCall = true
                : inAsyncCall = false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                      child: cubit.cartProducts.isEmpty
                          ? const Center(
                              child: Image(
                                  height: 120,
                                  width: 120,
                                  image: AssetImage('assets/empty cart.png')),
                            )
                          : ListView.builder(
                              itemCount: cubit.cartProducts.length,
                              itemBuilder: (context, index) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: CartItemWidget(
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () async {
                                          await cubit.addOrRemoveCart(
                                              id: cubit.cartProducts[index].id
                                                  .toString());
                                        },
                                        productModel:
                                            cubit.cartProducts[index]),
                                  ))),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CartBuCustomButton(
                        text: 'Total Price=${cubit.totalPrice}, Bay Now'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
