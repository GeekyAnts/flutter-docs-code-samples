import 'dart:async';

import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(title: 'State Change Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  bool showtext=true;
  bool toggleState=true;
  Timer t2;

  void toggleBlinkState(){
    setState((){
      toggleState=!toggleState;
    });
    var twenty = const Duration(milliseconds: 1000);

     if(toggleState==false) {
       t2=new Timer.periodic(twenty, (Timer t) {
         toggleShowText();
       });
     }else
       {
         t2.cancel();
       }
  }

  void toggleShowText(){
    setState((){
      showtext=!showtext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (showtext?(
              new Text(
                'I love blinking.',
              )
            )
                :
              (new Container())
            ),
            new Padding(
            padding: new EdgeInsets.only(top: 70.0),
              child: new RaisedButton(
                onPressed: toggleBlinkState,
                child:
                (toggleState?(
                new Text("Blink"))
                    :
                (new Text("Stop Blinking"))
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
