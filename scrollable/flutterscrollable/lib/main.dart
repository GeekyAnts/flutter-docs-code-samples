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
  var data = [
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
      body: new Column(
        children: <Widget>[
          new ListView.builder(
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
          )
        ],
      ),
    );
  }
}
