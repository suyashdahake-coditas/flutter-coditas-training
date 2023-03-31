import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_updated/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final String id;
  final String productId;
  final int quantity;
  final double price;

  const CartItemWidget(
      {Key? key,
      required this.title,
      required this.id,
      required this.quantity,
      required this.price,
      required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Theme.of(context).colorScheme.error,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Are you Sure?'),
                  content:
                      const Text('Do you want to remove the item from the cart?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                )),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                child: FittedBox(child: Text('\$$price')),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text(
              '$quantity x',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}
