import 'package:flutter/material.dart';
import 'package:shop_app_updated/providers/cart.dart';
import 'package:shop_app_updated/providers/orders.dart';
import 'package:shop_app_updated/screens/cart_screen.dart';
import 'package:shop_app_updated/screens/edit_product_screen.dart';
import 'package:shop_app_updated/screens/orders_screen.dart';
import 'package:shop_app_updated/screens/product_detail_screen.dart';
import 'package:shop_app_updated/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_updated/providers/products_provider.dart';
import 'package:shop_app_updated/screens/user_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          // useMaterial3: true,
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrangeAccent),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
          UserProductsScreen.routeName: (context) => const UserProductsScreen(),
          EditProductScreen.routeName: (context) => const EditProductScreen(),
        },
      ),
    );
  }
}
