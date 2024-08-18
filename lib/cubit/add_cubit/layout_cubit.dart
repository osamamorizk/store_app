import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:store_app/Models/product_model.dart';

import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/shared_pref.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  Set<String> productsId = {};
  List<ProductModel> cartProducts = [];

  num totalPrice = 0;
  int quantity = 0;
  final token = CahedStorge.getFromCache(key: 'token');
  Future<void> getCart() async {
    emit(LayoutLoading());
    try {
      cartProducts.clear();
      var response = await Api()
          .get(url: 'https://student.valuxapps.com/api/carts', token: token);
      if (response['status'] == true) {
        // cartProducts.clear();
        totalPrice = response['data']['total'];

        for (var product in response['data']['cart_items']) {
          productsId.add(product['product']['id'].toString());
          cartProducts.add(ProductModel.fromJson(product['product']));
        }
        emit(LayoutSuccess());
      } else {
        emit(LayoutFailure());
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addOrRemoveCart({required String id}) async {
    emit(LayoutAddLoading());
    try {
      var response = await Api().post(
        url: "https://student.valuxapps.com/api/carts",
        token: token,
        data: {"product_id": id},
      );
      // AddCartProductModel addCartProductModel =
      //     AddCartProductModel.fromJson(response);
      if (response['status'] == true) {
        if (productsId.contains(id)) {
          productsId.remove(id);
        } else {
          productsId.add(id);
        }
        await getCart();
        emit(LayoutAddSuccess());
      } else {
        emit(LayoutAddFailure());
      }
      // throw Exception(error.toString());
    } catch (error) {
      emit(LayoutAddFailure());
    }
  }
}
