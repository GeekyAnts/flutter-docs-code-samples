import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new ModularApp());

class ModularApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ModularHomePage(),
    );
  }
}

class ModularHomePage extends StatefulWidget {
  ModularHomePage({Key key}) : super(key: key);

  @override
  _ModularHomePageState createState() => new _ModularHomePageState();
}

class CustomCard extends StatelessWidget {
  CustomCard({ this.index,  this.onPress});
  final index;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return new Card(
        color: Colors.grey[300],
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(top: 15.0),
                child: new Text(
                  'Card $index',
                  style: new TextStyle(fontSize: 28.0),
                )),
            new ButtonTheme.bar(
              child: new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    child: const Text('Press'),
                    onPressed: this.onPress,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class _ModularHomePageState extends State<ModularHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Modular Widgets"),
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CustomCard(
                    onPress: () {
                      print('Card $index');
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}
