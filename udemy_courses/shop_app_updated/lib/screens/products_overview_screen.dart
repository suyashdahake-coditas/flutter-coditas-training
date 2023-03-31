import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_updated/providers/cart.dart';
import 'package:shop_app_updated/providers/products_provider.dart';
import 'package:shop_app_updated/screens/cart_screen.dart';
import 'package:shop_app_updated/widgets/app_drawer.dart';
import 'package:shop_app_updated/widgets/badge.dart';
import 'package:shop_app_updated/widgets/product_grid.dart';

enum filterOptions {
  favourites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration.zero).then((_){
    //   Provider.of<ProductsProvider>(context , listen: false).fetchAndSetProducts();
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      print('Data not fetched');
      Provider.of<ProductsProvider>(context, listen: false)
          .fetchAndSetProducts()
          .then((_) {
        setState(() {
          _isLoading = false;
          print('Data fetched');
        });
      });
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productsContainer =
        Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (filterOptions selectedValue) {
                if (selectedValue == filterOptions.favourites) {
                  _showOnlyFavourites = false;
                } else {
                  _showOnlyFavourites = true;
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: filterOptions.favourites,
                      child: Text('Only Favourite'),
                    ),
                    const PopupMenuItem(
                      value: filterOptions.all,
                      child: Text('Show All'),
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => BadgeWidget(
              value: cart.itemCount.toString(),
              color: Colors.red,
              child: ch as Widget,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading?Center(child: CircularProgressIndicator(),):ProductsGrid(
        showFavs: _showOnlyFavourites,
      ),
    );
  }
}
