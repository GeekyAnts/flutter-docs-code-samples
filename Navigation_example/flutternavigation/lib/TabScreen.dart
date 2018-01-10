import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("You just used the tab navigation!"),
        ],
      ),
    );
  }
}
