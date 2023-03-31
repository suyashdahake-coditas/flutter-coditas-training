import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_updated/providers/products_provider.dart';
import 'package:shop_app_updated/screens/edit_product_screen.dart';
import 'package:shop_app_updated/widgets/app_drawer.dart';
import 'package:shop_app_updated/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  Future<void> _refreshProducts(BuildContext context) async{
    await Provider.of<ProductsProvider>(context).fetchAndSetProducts();
  }

  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName,);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: ()=>_refreshProducts(context) ,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  productsData.items[i].title,
                  productsData.items[i].imageUrl,
                  id: productsData.items[i].id,
                ),
                const Divider(),
              ],
            ),
            itemCount: productsData.items.length,
          ),
        ),
      ),
    );
  }
}
