import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  String _email;
  String _password;
  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Alert'),
            content: new Text('Email: $_email, password: $_password'),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Form Input Demo"),
      ),
      body: new ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new TextField(
              controller: _controller,
              decoration: new InputDecoration(
                  hintText: 'Type something', labelText: "Text Field "),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 140.0),
            child: new RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text('Alert'),
                      content: new Text('You typed ${_controller.text}'),
                    ),
                  );
                },
                child: new Text('Submit')),
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 10.0),
            child: new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    validator: (value) =>
                        !value.contains('@') ? 'Not a valid email.' : null,
                    onSaved: (val) => _email = val,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter you email',
                      labelText: 'Email',
                    ),
                  ),
                  new TextFormField(
                    validator: (val) =>
                        val.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => _password = val,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      labelText: 'New Password',
                    ),
                    obscureText: true,
                  ),
                  new RaisedButton(
                    onPressed: _submit,
                    child: new Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
