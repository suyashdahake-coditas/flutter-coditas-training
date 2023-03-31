import 'package:expense_tracker_app/models/transaction.dart';
import 'package:expense_tracker_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      './assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
      children: transactions.map((tx) => TransactionItem(
        key: ValueKey(tx.id),
        transactions: tx,
        deleteTransaction: deleteTransaction,
      )).toList()
          );
  }
}
