import 'package:flutter/material.dart';
import 'package:store_app/Models/category_model.dart';

class CategoryName extends StatelessWidget {
  const CategoryName({
    super.key,
    this.onPressed,
    required this.categoryModel,
  });
  final void Function()? onPressed;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.05))),
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListTile(
          leading: Image(
              height: 100,
              width: 100,
              image: NetworkImage(categoryModel.image)),
          title: Text(
            categoryModel.name,
            style: TextStyle(fontSize: 20),
          ),
          trailing: IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.arrow_forward_ios_rounded)),
        ),
      ),
    );
  }
}
