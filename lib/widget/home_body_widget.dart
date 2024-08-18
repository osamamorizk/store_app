import 'package:flutter/material.dart';
import 'package:store_app/consts.dart';
import 'package:store_app/helper/shared_pref.dart';
import 'package:store_app/widget/category_listview.dart';
import 'package:store_app/widget/custom_gridview.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Hello, ${CahedStorge.getFromCache(key: 'name')}',
          style: const TextStyle(
            fontSize: 22,
            color: kcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image(
                  fit: BoxFit.fill,
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  image: const AssetImage('assets/sale.png'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: kcolor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(height: 120, child: CategoryListView()),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'All Products',
                    style: TextStyle(
                      color: kcolor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              CustomGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
