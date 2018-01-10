import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
}

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
  String _ipAddress = 'Unknown';

  _getIPAddress() async {
    String url = 'https://httpbin.org/ip';
    var httpClient = createHttpClient();
    var response = await httpClient.read(url);
    String ip = JSON.decode(response)['origin'];
    setState(() {
      _ipAddress = ip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: _getIPAddress,
                child: new Text('Get IP address'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
