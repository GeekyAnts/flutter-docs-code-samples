import 'package:flutter/material.dart';

void main() => runApp(new PlatformApp());

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new PlatformPage(),
    );
  }
}

class PlatformPage extends StatefulWidget {
  PlatformPage({Key key}) : super(key: key);

  @override
  _PlatformPageState createState() => new _PlatformPageState();
}

class _PlatformPageState extends State<PlatformPage> {
  String get getPlatform {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return "iOS";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return "android";
    } else if (Theme.of(context).platform == TargetPlatform.fuchsia) {
      return "fuchsia";
    } else {
      return "not recognised ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Platform Demo"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Platform is $getPlatform'),
          ],
        ),
      ),
    );
  }
}
