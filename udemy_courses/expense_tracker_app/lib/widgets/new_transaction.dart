import 'package:expense_tracker_app/widgets/adaptive_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx, {super.key}) {
    print('Constructor New Transaction');
  }

  // final Function addNewTransaction;
  //
  // // final void Function({required String title, required double amount, required DateTime date}) addNewTransaction;
  //
  // NewTransaction({super.key, required this.addNewTransaction});

  @override
  State<NewTransaction> createState() {
    print('createState New Transaction');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _NewTransactionState() {
    print('Constructor New Transaction State ');
  }

  @override
  void initState() {
    print('initState()');
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget()');
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
@override
  void dispose() {
  print('dispose()');
  // TODO: implement dispose
    super.dispose();
  }
  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    // widget.addNewTransaction(
    //   title: enteredTitle,
    //   amount: enteredAmount,
    //   date: _selectedDate,
    // );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      // print(pickedDate);
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => titleInput = val,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                // onChanged: (val) => amountInput = val,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                onSubmitted: (_) => _submitData(),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  AdaptiveFlatButton(
                    handler: _presentDatePicker,
                    text: 'Choose Date',
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _submitData(),
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
