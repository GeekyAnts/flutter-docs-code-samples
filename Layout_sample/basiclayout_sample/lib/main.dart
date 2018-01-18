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
  MainAxisAlignment mainaxis = MainAxisAlignment.center;
  bool newCenter = false;
  void changeToSpaceBetween() {
    setState(() {
      if (mainaxis == MainAxisAlignment.center) {
        mainaxis = MainAxisAlignment.spaceBetween;
      } else {
        mainaxis = MainAxisAlignment.center;
      }
    });
  }

  void changeToCenter() {
    setState(() {
      newCenter = !newCenter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
        body: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          new Container(
            height: screenSize.height / 4,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  onPressed: changeToSpaceBetween,
                  child: new Text("Show Space in between"),
                ),
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new RaisedButton(
                    onPressed: changeToCenter,
                    child: new Text("Show Center"),
                  ),
                )
              ],
            ),
          ),
          new Container(
              height: 3 * screenSize.height / 4,
              child: (newCenter
                  ? (new Center(
                      child: new Container(
                      child: new Column(
                        mainAxisAlignment: mainaxis,
                        children: <Widget>[
                          new Container(
                            color: Colors.red,
                            width: 100.0,
                            height: 100.0,
                          ),
                          new Container(
                            color: Colors.blue,
                            width: 100.0,
                            height: 100.0,
                          ),
                          new Container(
                            color: Colors.green,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ],
                      ),
                    )))
                  : (new Column(
                      mainAxisAlignment: mainaxis,
                      children: <Widget>[
                        new Container(
                          color: Colors.red,
                          width: 100.0,
                          height: 100.0,
                        ),
                        new Container(
                          color: Colors.blue,
                          width: 100.0,
                          height: 100.0,
                        ),
                        new Container(
                          color: Colors.green,
                          width: 100.0,
                          height: 100.0,
                        ),
                      ],
                    )))),
        ]));
  }
}
