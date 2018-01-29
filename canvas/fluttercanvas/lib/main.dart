import 'package:flutter/material.dart';

void main() => runApp(new CanvasApp());

class CanvasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CanvasHomePage(),
    );
  }
}

class CanvasHomePage extends StatefulWidget {
  CanvasHomePage({Key key}) : super(key: key);
  @override
  _CanvasHomePageState createState() => new _CanvasHomePageState();
}

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.amber;
    canvas.drawCircle(new Offset(100.0, 200.0), 40.0, paint);
    Paint paintRect = new Paint();
    paintRect.color = Colors.lightBlue;
    Rect rect =
        new Rect.fromPoints(new Offset(150.0, 300.0), new Offset(300.0, 400.0));
    canvas.drawRect(rect, paintRect);
  }

  bool shouldRepaint(Sky oldDelegate) => false;
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}

class _CanvasHomePageState extends State<CanvasHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomPaint(
        painter: new Sky(),
      ),
    );
  }
}
