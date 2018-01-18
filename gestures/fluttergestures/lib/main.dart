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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text("Gestures"),
        ),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Tap, Long Press, Swipe Horizontally or Vertically '),
          ],
        )),
      ),
      onTap: () {
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text('Tapped')));
      },
      onLongPress: () {
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text('Long Pressed')));
      },
      onVerticalDragEnd: (DragEndDetails value) {
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text('Swiped Vertically')));
      },
      onHorizontalDragEnd: (DragEndDetails value) {
        _scaffoldKey.currentState.showSnackBar(
            new SnackBar(content: new Text('Swiped Horizontally')));
      },
    );
  }
}
