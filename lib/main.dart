import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc_opserver.dart';
import 'package:store_app/consts.dart';
import 'package:store_app/cubit/add_cubit/layout_cubit.dart';
import 'package:store_app/helper/shared_pref.dart';
import 'package:store_app/views/about_store.dart';
import 'package:store_app/views/cart_view.dart';
import 'package:store_app/views/contact_us.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/views/products_from_category.dart';
import 'package:store_app/views/register_view.dart';
import 'package:store_app/widget/custom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CahedStorge.cacheIntialization();
  Bloc.observer = SimpleBlocObserver();
  token = CahedStorge.getFromCache(key: 'token');
  print(token);
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginView.id: (context) => LoginView(),
          RegisterView.id: (context) => RegisterView(),
          CartView.id: (context) => CartView(),
          ProductsFromCategory.id: (context) => ProductsFromCategory(),
          AboutStore.id: (context) => AboutStore(),
          ContactUs.id: (context) => ContactUs(),
          CustomBottomNavigationBar.id: (context) => CustomBottomNavigationBar()
        },
        home: token != null && token != ''
            ? CustomBottomNavigationBar()
            : LoginView(),
      ),
    );
  }
}
