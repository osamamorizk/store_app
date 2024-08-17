import 'package:store_app/Models/product_model.dart';
import 'package:store_app/helper/api.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    Map<String, dynamic> json =
        await Api().get(url: 'https://student.valuxapps.com/api/products');
    List data = json['data']['data'];

    List<ProductModel> productsList = [];
    for (var product in data) {
      productsList.add(ProductModel.fromJson(product));
    }

    return productsList;
  }
}
