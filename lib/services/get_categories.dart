import 'package:store_app/Models/category_model.dart';
import 'package:store_app/helper/api.dart';

class GetCategories {
  Future<List<CategoryModel>> getCategories() async {
    Map<String, dynamic> json =
        await Api().get(url: 'https://student.valuxapps.com/api/categories');
    List<dynamic> data = json['data']['data'];

    List<CategoryModel> categoryList = [];
    for (var categry in data) {
      categoryList.add(CategoryModel.fromJson(categry));
    }

    return categoryList;
  }
}
