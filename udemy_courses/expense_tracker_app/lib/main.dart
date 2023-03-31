import 'dart:io';
import 'package:expense_tracker_app/models/transaction.dart';
import 'package:expense_tracker_app/widgets/chart.dart';
import 'package:expense_tracker_app/widgets/new_transaction.dart';
import 'package:expense_tracker_app/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                  color: Colors.purple,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              toolbarTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      titleLarge: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                  .bodyMedium,
              titleTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      titleLarge: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                  .titleLarge),
          buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light()),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(secondary: Colors.amber, error: Colors.red)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: 'id',
    //   amount: 250,
    //   date: DateTime.now(),
    //   title: 'Title',
    // ),
    // Transaction(
    //   id: 'id2',
    //   amount: 2520,
    //   date: DateTime.now(),
    //   title: 'Title2',
    // )
  ];

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) => GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(_addTransaction),
            ));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
     super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  bool _showChart = false;

  // void _addTransaction(
  //     {required String txTitle,
  //     required double txAmount,
  //     required DateTime chosenDate}) {
  //   final newTx = Transaction(
  //       amount: txAmount,
  //       title: txTitle,
  //       id: DateTime.now().toString(),
  //       date: chosenDate);
  //   setState(() {
  //     _userTransaction.add(newTx);
  //   });
  // }
  List<Widget> _buildLandscapeContent(MediaQueryData mediaQueryData,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Row(
        children: [
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Switch.adaptive(
            value: _showChart,
            onChanged: (val) => setState(() {
              _showChart = val;
            }),
          ),
        ],
      ),
      _showChart
          ? SizedBox(
              height:
                  ((mediaQueryData.size.height - appBar.preferredSize.height) -
                          mediaQueryData.padding.top) *
                      0.7,
              child: Chart(
                recentTransactions: _recentTransactions,
              ),
            )
          : txListWidget
    ];
  }

  PreferredSizeWidget cupertinoAppBar() {
    return CupertinoNavigationBar(
      middle: const Text('Personal Expense Tracker'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: const Icon(CupertinoIcons.add),
            onTap: () => _startAddNewTransaction(context),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget materialAppBar() {
    return AppBar(
      title: const Text(
        "Personal Expense Tracker",
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  List<Widget> _buildPortraitContent(MediaQueryData mediaQueryData,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      SizedBox(
        height: Platform.isIOS
            ? ((mediaQueryData.size.height - appBar.preferredSize.height) -
                    mediaQueryData.padding.top) *
                0.3
            : ((mediaQueryData.size.height - appBar.preferredSize.height) -
                    mediaQueryData.padding.top) *
                0.3,
        child: Chart(
          recentTransactions: _recentTransactions,
        ),
      ),
      txListWidget,
    ];
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    Size size = mediaQuery.size;
    final PreferredSizeWidget appBar =
        Platform.isIOS ? cupertinoAppBar() : materialAppBar();
    final txListWidget = SizedBox(
      height: (size.height - appBar.preferredSize.height) * 0.7,
      child: TransactionList(
          transactions: _userTransaction,
          deleteTransaction: _deleteTransaction),
    );
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              ..._buildLandscapeContent(mediaQuery, appBar, txListWidget),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddNewTransaction(context),
                    child: const Icon(Icons.add),
                  ),
          );
  }
}

// class AppbarTop extends StatelessWidget implements PreferredSizeWidget {
//   const AppbarTop();
//
//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS ? CupertinoNavigationBar() : AppBar();
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
// }
