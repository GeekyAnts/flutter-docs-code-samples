import 'package:flutter/material.dart';

import './DrawerScreen.dart' as DrawerScreen;
import './HomeScreen.dart' as Home;
import './TabScreen.dart' as TabScreen;
import './UsualNavScreen.dart' as UsualNavScreen;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new MyHomePage(),
        routes: <String, WidgetBuilder>{
          '/a': (BuildContext context) => new UsualNavScreen.UsualNavScreen(),
          '/b': (BuildContext context) => new DrawerScreen.DrawerNavScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new Drawer(
          child: new ListTile(
            leading: new Icon(Icons.change_history),
            title: new Text('Screen2'),
            onTap: () {
              Navigator.of(context).pushNamed("/b");
            },
          ),
          elevation: 20.0,
        ),
        appBar: new AppBar(
          title: new Text("Home"),
        ),
        bottomNavigationBar: new Material(
          child: new TabBar(
            tabs: <Tab>[
              new Tab(
                icon: new Icon(Icons.person),
              ),
              new Tab(
                icon: new Icon(Icons.email),
              ),
            ],
            controller: controller,
          ),
          color: Colors.blue,
        ),
        body: new TabBarView(
          children: <Widget>[new Home.HomeScreen(), new TabScreen.TabScreen()],
          controller: controller,
        ));
  }
}
