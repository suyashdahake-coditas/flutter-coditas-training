import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flexible & Expanded'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.red,
            child: const Text('Item 1'),
          ),
          Expanded(
            flex: 5,
            // fit: FlexFit.tight,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: const Text('Item 2'),
            ),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.orange,
              child: const Text('Item 3'),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
