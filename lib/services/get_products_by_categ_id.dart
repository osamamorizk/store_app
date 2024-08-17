import 'package:store_app/Models/product_model.dart';
import 'package:store_app/helper/api.dart';

class GetProductsByCategId {
  Future<List<ProductModel>> getProductsByCategId(int id) async {
    Map<String, dynamic> json = await Api().get(
      url: 'https://student.valuxapps.com/api/categories/$id',
    );
    List<dynamic> data = json['data']['data'];

    List<ProductModel> categoryList = [];
    for (var categry in data) {
      categoryList.add(ProductModel.fromJson(categry));
    }

    return categoryList;
  }
}
