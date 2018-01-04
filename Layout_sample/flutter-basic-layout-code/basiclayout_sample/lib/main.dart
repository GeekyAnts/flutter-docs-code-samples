import 'package:flutter/material.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  MainAxisAlignment mainaxis= MainAxisAlignment.center;

  bool Newcenter=false;



  void changeToSpaceBetween(){
    setState((){
      if(mainaxis==MainAxisAlignment.center) {
        mainaxis = MainAxisAlignment.spaceBetween;
      }else{
        mainaxis = MainAxisAlignment.center;
      }
    });
  }
  void changeToCenter(){
    setState((){

      Newcenter = !Newcenter;
    });
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    print(mainaxis);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(

      body:
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          new Column(
//          children: <Widget>[

          new Container(
            height: screenSize.height / 4,
            child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  onPressed: changeToSpaceBetween,
                  child: new Text("Show Space in between"),
                ),
                new Padding(padding: new EdgeInsets.all(10.0),child: new RaisedButton(
                  onPressed: changeToCenter,
                  child: new Text("Show Center"),
                ),)
                
              ],
            ),
          ),
        new Container(
          height: 3*screenSize.height / 4,
          child:
          (Newcenter?(
          new Center(
            child: new Container(child: new Column(
              mainAxisAlignment: mainaxis,
            children: <Widget>[
                new Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 100.0,
                ),
                new Container(
                  color: Colors.blue,
                  width: 100.0,
                  height: 100.0,
                ),
                new Container(
                  color: Colors.green,
                  width: 100.0,
                  height: 100.0,
                ),

              ],
            ),
            )
          )
          ):(
              new Column(
                mainAxisAlignment: mainaxis,
                children: <Widget>[
                  new Container(
                    color: Colors.red,
                    width: 100.0,
                    height: 100.0,
                  ),
                  new Container(
                    color: Colors.blue,
                    width: 100.0,
                    height: 100.0,
                  ),
                  new Container(
                    color: Colors.green,
                    width: 100.0,
                    height: 100.0,
                  ),

                ],
              )
              )
          )
    ),

    ]
      )


    );
  }
}
