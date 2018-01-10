import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Gestures"),
        ),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[new Text('Tap, Double Tap, Long Press or Swipe')],
        )),
      ),
      onTap: () {
        print('Tap');
      },
      onDoubleTap: () {
        print('Double Tap');
      },
      onLongPress: () {
        print('Long Press');
      },
      onVerticalDragStart: (DragStartDetails d) {
        print('Swipe');
      },
    );
  }
}
