import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness brightness = Brightness.light;
  var buttonText = "Dark Theme";
  changeTheme() {
    if (brightness == Brightness.dark) {
      this.setState(() {
        brightness = Brightness.light;
        buttonText = "Dark Theme";
      });
    } else {
      this.setState(() {
        brightness = Brightness.dark;
        buttonText = "Light Theme";
      });
    }
  }

  var textStyle = new TextStyle(
      fontSize: 32.0, color: Colors.cyan, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.cyan,
        brightness: brightness,
      ),
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Styling')),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Sample text',
                style: textStyle,
              ),
              new Padding(
                  padding: new EdgeInsets.all(20.0),
                  child: new Icon(Icons.lightbulb_outline,
                      size: 48.0, color: Colors.redAccent)),
              new RaisedButton(
                child: new Text(buttonText),
                onPressed: () {
                  this.changeTheme();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
