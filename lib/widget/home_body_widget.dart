import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/consts.dart';
import 'package:store_app/cubit/add_cubit/layout_cubit.dart';
import 'package:store_app/helper/shared_pref.dart';
import 'package:store_app/widget/category_listview.dart';
import 'package:store_app/widget/custom_gridview.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({
    super.key,
  });

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  bool inAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall:
              state is LayoutLoading ? inAsyncCall = true : inAsyncCall = false,
          child: Scaffold(
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
                    SizedBox(
                      height: 95,
                      child: ListView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              child: Image(
                                fit: BoxFit.fill,
                                height: 90,
                                width: 300,
                                image: AssetImage('assets/sale.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              child: Image(
                                fit: BoxFit.fill,
                                height: 90,
                                width: 300,
                                image: AssetImage('assets/banner1.jpg'),
                              ),
                            ),
                          ),
                        ],
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
          ),
        );
      },
    );
  }
}
