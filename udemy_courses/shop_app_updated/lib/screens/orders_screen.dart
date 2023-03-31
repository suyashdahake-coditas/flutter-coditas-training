import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_updated/providers/orders.dart';
import 'package:shop_app_updated/widgets/app_drawer.dart';
import 'package:shop_app_updated/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building');
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        body: FutureBuilder(
            future:
                Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
            builder: (ctx, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   print(snapshot.connectionState);
              //   print('loder  fetched');
              //   print(snapshot.error);
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // } else {
                if (snapshot.error == null) {
                  return Consumer<Orders>(
                    builder: (ctx, orderData, child) => ListView.builder(
                      itemBuilder: (context, index) => OrderItemWidget(
                        order: orderData.orders[index],
                      ),
                      itemCount: orderData.orders.length,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('An error occurred!'),
                  );
                }
              // }
            }));
  }
}
