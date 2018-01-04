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
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      drawer: new Drawer(
        child:new ListTile(
              leading: new Icon(Icons.change_history),
              title: new Text('Screen2'),
              onTap: () {
                // change app state...
                Navigator.of(context).pushNamed("/b");
              },
            ),
        elevation: 20.0,

      ),
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
