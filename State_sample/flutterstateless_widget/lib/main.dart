import 'package:flutter/material.dart';


void main() => runApp(new MyStatelessWidget(title: "StatelessWidget Example to show immutable data"));

class MyStatelessWidget extends StatelessWidget {
  final String title;
  MyStatelessWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
              title,
              textDirection: TextDirection.ltr,
      ),
    );
  }
}