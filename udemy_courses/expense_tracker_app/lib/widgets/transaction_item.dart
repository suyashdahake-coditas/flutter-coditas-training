import 'dart:math';
import 'package:expense_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transactions;
  final Function deleteTransaction;

  const TransactionItem(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: CircleAvatar(
            backgroundColor: _bgColor,
            // backgroundColor:Colors.purple,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Text('₹${widget.transactions.amount}'),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transactions.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transactions.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () =>
                    widget.deleteTransaction(widget.transactions.id),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () =>
                    widget.deleteTransaction(widget.transactions.id),
              ),
      ),
    );
  }
}
