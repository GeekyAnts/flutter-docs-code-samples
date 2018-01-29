import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new LocalStorageApp());

SharedPreferences prefs;

class LocalStorageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LocalStoragePage(),
    );
  }
}

class LocalStoragePage extends StatefulWidget {
  LocalStoragePage({Key key}) : super(key: key);
  @override
  _LocalStoragePageState createState() => new _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage> {
  int _counter;
  @override
  initState() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('counter') == null) {
      setState(() {
        _counter = 0;
      });
    } else {
      setState(() {
        _counter = prefs.getInt('counter');
      });
    }
  }

  _incrementCounter() {
    prefs.setInt('counter', ++_counter);
    setState(() {
      _counter = _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Local Storage demo'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
