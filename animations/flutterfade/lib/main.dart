import 'package:flutter/material.dart';

void main() {
  runApp(new Center(child: new LogoFade()));
}

class LogoFade extends StatefulWidget {
  _LogoFadeState createState() => new _LogoFadeState();
}

class _LogoFadeState extends State<LogoFade> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 1.0).animate(curve);
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new FadeTransition(
      opacity: animation,
      child: new Container(
        height: 300.0,
        width: 300.0,
        child: new FlutterLogo(),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
