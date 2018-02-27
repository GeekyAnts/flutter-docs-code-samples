import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(new MyStatelessWidget(title: "StatelessWidget Example"));

class MyStatelessWidget extends StatelessWidget {
  final String title;
  MyStatelessWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyStatefulWidgetState createState() => new _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool showtext = true;
  bool toggleState = true;
  Timer t2;

  void toggleBlinkState() {
    setState(() {
      toggleState = !toggleState;
    });
    var twenty = const Duration(milliseconds: 1000);

    if (toggleState == false) {
      t2 = new Timer.periodic(twenty, (Timer t) {
        toggleShowText();
      });
    } else {
      t2.cancel();
    }
  }

  void toggleShowText() {
    setState(() {
      showtext = !showtext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("State Change Demo"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (showtext
                ? (new Text(
                    'I love blinking.',
                  ))
                : (new Container())
            ),
            new Padding(
                padding: new EdgeInsets.only(top: 70.0),
                child: new RaisedButton(
                    onPressed: toggleBlinkState,
                    child: (toggleState
                        ? (new Text("Blink"))
                        : (new Text("Stop Blinking"))
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
