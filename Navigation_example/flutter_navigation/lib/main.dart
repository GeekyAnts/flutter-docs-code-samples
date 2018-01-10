import 'package:flutter/material.dart';
import 'package:flutter_navigation/drawerNavscreen.dart';
import 'package:flutter_navigation/usualNavscreen.dart';
import 'package:flutter_navigation/homeScreen.dart' as home;
import 'package:flutter_navigation/tabScreen.dart' as tabScreen;



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => new usualNavscreen(),
        '/b': (BuildContext context) => new drawerNavscreen(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller=new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        child:new ListTile(
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
          tabs: <Tab> [
            new Tab(icon: new Icon(Icons.person),),
            new Tab(icon: new Icon(Icons.email),),
          ],
          controller: controller,
        ),
        color: Colors.blue,
      ),
      body: new TabBarView(
        children: <Widget> [
          new home.homeScreen(),
          new tabScreen.tabScreen()
        ],
        controller: controller,
      )
    );
  }
}
