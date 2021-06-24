import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _fontColor = Colors.black;

  // change fontcolor according to the value of counter
  void _changeFontColor() {
    setState(() {
      if (_counter > 0) {
        _fontColor = Colors.green;
      } else if (_counter < 0) {
        _fontColor = Colors.red;
      } else {
        _fontColor = Colors.black;
      }
    });
  }
  void _incraseCounter() {
    setState(() {
      _counter++;
    });
    _changeFontColor();
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
    _changeFontColor();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _changeFontColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '$_counter',
              //apply headline1 theme, and change font color with _fontColor
              style: Theme.of(context).textTheme.headline1!.copyWith(color: _fontColor)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _decreaseCounter,
                    child: Text("Decrease")),
                ElevatedButton(
                    onPressed: _resetCounter,
                    child: Text("Reset")),
                ElevatedButton(
                    onPressed: _incraseCounter,
                    child: Text("Increase")),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
