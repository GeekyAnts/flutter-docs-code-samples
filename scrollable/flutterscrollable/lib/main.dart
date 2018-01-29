import 'package:flutter/material.dart';

void main() => runApp(new ScrollableApp());

class ScrollableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ScrollablePage(),
    );
  }
}

class ScrollablePage extends StatefulWidget {
  ScrollablePage({Key key}) : super(key: key);
  @override
  _ScrollablePageState createState() => new _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  var data = [
    'Devin',
    'Jackson',
    'James',
    'Joel',
    'John',
    'Jillian',
    'Jimmy',
    'Julie',
    'Devin',
    'Jackson',
    'James',
    'Joel',
    'John',
    'Jillian',
    'Jimmy',
    'Julie',
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, int index) {
        return new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text(
            data[index],
            style: new TextStyle(fontSize: 20.0),
          ),
        );
      },
    ));
  }
}
