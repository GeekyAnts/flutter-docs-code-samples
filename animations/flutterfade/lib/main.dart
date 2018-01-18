import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FadeInView extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.0, end: 1.0);
  FadeInView({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Material(
        child: new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Text("Fading in",
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontSize: 28.0)),
      ),
    ));
  }
}

class App extends StatefulWidget {
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new MaterialApp(home: new FadeInView(animation: animation));
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(new App());
}
