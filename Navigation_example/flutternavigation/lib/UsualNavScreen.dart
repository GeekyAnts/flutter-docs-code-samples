import 'package:flutter/material.dart';

class UsualNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Normal Navigation"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You just used the usual navigator!"),
            new RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("Go back Home"),
            )
          ],
        ),
      ),
    );
  }
}
