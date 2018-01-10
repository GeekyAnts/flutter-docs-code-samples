import 'package:flutter/material.dart';


class homeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/a");
              },
              child: new Text("Click to Navigate"),
            )

          ],
        ),
    );
  }
}
